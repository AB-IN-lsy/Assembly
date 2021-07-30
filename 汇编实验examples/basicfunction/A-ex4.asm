.orig x3000
ld r0, NUMBER
ld r1, ZERO
add r0, r0, r1
out
halt
NUMBER .fill #3
ZERO .fill x30
.end
.orig x3000
and r0, r0, 0
ld r1, NUMBER
ld r2, Neg10
LOOP add r1, r2, r1
brn End10
add r0, r0, #1  ; add one to digit
brnzp  LOOP
End10 halt
NUMBER .fill #68
Neg10 .fill xFFF6 ; -10
.end
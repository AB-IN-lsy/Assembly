.orig x3000
ld r0, COUNTER
LOOP add r0, r0, #-1
brp LOOP
halt
COUNTER .fill #10
.end
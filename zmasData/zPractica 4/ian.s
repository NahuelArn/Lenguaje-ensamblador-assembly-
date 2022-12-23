.data
A: .word 1
B: .word 3
V: .word 0
 .code
 ld r1, A(r0)
 ld r2, B(r0)
 daddi r4, r0, 0
loop: dsll r1, r1, 1
       sd r1,V(r4)
       daddi r4, r0, 8
   daddi r2, r2, -1
   bnez r2, loop
 halt
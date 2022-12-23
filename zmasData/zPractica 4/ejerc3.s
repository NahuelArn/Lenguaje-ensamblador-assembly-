.data 
A: .word 1 
B: .word 3 
V: .word 0

.code    
ld r2, B(r0)
ld r1, A(r0)
daddi r5, r0, 0 #aaa
#dadd r10, r0, r1
loop: dadd r10, r0, r1
daddi r2, r2, -1
dsll r1, r1, 1
#dadd r10, r0, r1

sd r10, V(r5)
#dadd r10, r0, r1
daddi r5, r5, 8 #aaaa

bnez r2, loop
dadd r10, r0, r1
sd r10, V(r5)
halt
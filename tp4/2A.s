#MIPS

.data          #VARIABLES ORG 1000H
A: .word 1       
B: .word 2       
.code          #CODIGO ORG 2000H
ld r1, A(r0)  #INST I
ld r2, B(r0)  #INST I+1
sd r2, A(r0)  #INST I+2
sd r1, B(r0)  #INST I+3
halt          #INST I+4
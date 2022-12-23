



































.data
control: .word32 0x10000
data: .word32 0x10008


.code
lwu $s0, control($0)
lwu $s1, data($0)
jal ingreso
dadd $a0, $v0, $v1
jal resultado
halt

ingreso: daddi $t0, $0, 8	; $t0 = leer numero

leer1: sd $t0, 0($s0)		; lee
ld $v0, 0($s1)				; $v0 = num1
slti $t1, $v0, 0			; si $v0 < 0 entonces $t1 = 1
bnez $t1, leer1
slti $t2, $v0, 10
beqz $t2, leer1

leer2: sd $t0, 0($s0)		; lee
ld $v1, 0($s1)				; $v1 = num2
slti $t2, $v1, 0
bnez $t2, leer2
slti $t1, $v1, 10			; si $v1 < 10 entonces $t1 = 1
beqz $t1, leer2

jr $ra

resultado: sd $a0, 0($s1)
daddi $t0, $0, 1
sd $t0, 0($s0)
jr $ra
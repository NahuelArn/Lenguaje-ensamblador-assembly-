;EXAMEN GRAFICA

.data
tabla: .word 5,2,10
c: .word 0x10000
d: .word 0x10008
rojo: .byte 255,0,0
azul: .byte 0,0,255
verde: .byte 0,255,0
coordx: .byte 0
coordy: .byte 49
.code
ld $s0, c($0)
ld $s1, d($0)
lbu $s2, coordy($0)
sb $s2, 4($s1)
lwu $t0, rojo($0)
sw $t0, 0($s1)
ld $t1, tabla($0)
daddi $s3, $0, 5
jal colores
daddi $t6, $t6, 8 ;desplazamiento
ld $t1, tabla($t6)
daddi $s2, $s2, -1
lwu $t0, azul($0)
sw $t0, 0($s1)
jal colores
daddi $t6, $t6, 8 ;desplazamiento
ld $t1, tabla($t6)
daddi $s2, $s2, -1
lwu $t0, verde($0)
sw $t0, 0($s1)
jal colores
daddi $t1, $t1, 8
daddi $s2, $s2, -1
beqz $t1, fin
fin: halt

colores: lbu $t2, coordx($0)
loop: sb $t2, 5($s1)
sb $s2, 4($s1)
sd $s3, 0($s0)
daddi $t1, $t1, -1
daddi $t2, $t2, 1
bnez $t1, loop
jr $ra

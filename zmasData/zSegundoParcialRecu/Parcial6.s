.data
tabla1: .word 21, 12, 5, 16, 8, 39, 10, 41, 4, 33
tabla2: .word 32, 24, 15, 32, 17, 28, 11, 20, 44, 21
control: .word32 0x10000
data: .word32 0x10008
long: .word 10
rojo: .byte 255,0,0,0
verde: .byte 0,255,0,0
       .code
       lwu $a0, 0(tabla1)
       ld $a1, long ($zero)
       jal rutina
       dadd $s0, $v0, $zero
       dadd $s1, $ v1, $zero
       lwu $a0, 0(tabla2)
       ld $a1, long ($zero)
       jal rutina
       dadd $s2, $v0, $zero
       dadd $s3, $ v1, $zero
       lwu $s6, control ($zero)
       lwu $s7, data ($zero)
       daddi $t0,$zero,7
       sb $t0,0($s6)
       sb $s1, 5($s7)
       sb $s2, 4($s7)
       lwu $s5, rojo ($zero)
       sw $s5, 0 ($s7)
       daddi $t0,$zero,5
       sb $t0,0($s6)
       sb $s3, 5($s7)
       sb $s4, 4($s7)
       lwu $s5, verde ($zero)
       sw $s5, 0 ($s7)
       daddi $t0,$zero,5
       sb $t0,0($s6)
       halt
rutina: daddi $v0,$zero,127
       daddi $v1,$zero,0
       daddi $t1,$zero,0
loop:  ld $t0,$a0($t1)
       slt $t2, $v0, $t0
       beqz $t2, noesmenor
       daddi $v0, $t0, 0
noesmenor: slt $t2, $v1, $t0
       bnez $t2, noesmayor
       daddi $v1, $t0, 0
noesmayor: daddi $a2, $a2, -1
       daddi $t1, $t1, 1
       bnez $a2, loop
       jr $ra

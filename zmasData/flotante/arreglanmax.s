.data
  control: .word32 0x10000
  data: .word32 0x10008
  cordX: .byte 0
  cordY: .byte 0
  
  rojo: .byte 255, 0, 0, 0
  #verde: .byte 0,255, 0, 0
  tabla1: .word 21,12,5,16,8,39,10,41,4,33
  #tabla2: .word 32, 24, 15, 32,17
.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)
  daddi $a0, $zero, 10
  daddi $a1, $zero, tabla1
  daddi $s2, $zero, 5
  jal minMax
  lbu $t0, cordX($zero)
  lbu $t1, cordY($zero)
  lwu $t2, rojo($zero)
  sw $t2, 0($s1)
  sb $t0, 5($s1)
  sb $t1, 4($s1)
  sd $s2, 0($s0)
halt 
  minMax: daddi $v0, $zero, 0
  daddi $v1, $zero, 0
  daddi $t0, $zero, 999
  daddi $t1, $zero, -999
loop: ld $t3, 0($a1)
  beqz $t3, fin
  slt $t4, $t3, $t0
  beqz $t4, noMini
  dadd $t0, $zero, $t3 #actualizo minimo
  noMini: slt $t5, $t1, $t3
  beqz $t5, noMax
   dadd $t1, $zero, $t3 #actualizo max
  noMax: daddi $a1, $a1, 8
    daddi $a0, $a0, -1
    bnez $a0, loop
    j fin


#--------------------------------------------------------------------------

  fin: dadd $v0, $zero, $t0
    dadd $v1, $zero, $t1
    sb $v0, cordX($zero) #min v1? nunca le pase el valor t0 min
    sb $v1, cordY($zero)  #max
    jr $ra
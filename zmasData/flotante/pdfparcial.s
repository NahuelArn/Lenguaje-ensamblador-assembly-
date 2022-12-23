.data
  a: .word 0
  b: .word 0
  c: .word 0
  control: .word32 0x10000
  data: .word32 0x10008

  res: .word 0
.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)
  jal ingreso 
  ld $a0, a($zero)
  ld $a1, b($zero)
  ld $a2, c($zero)
  jal calculo
halt

  ingreso: daddi $t0, $zero, 8
  daddi $t1, $zero, 3
  daddi $t3, $zero, 0
  loop: daddi $t1, $t1, -1
    sd $t0, 0($s0)
    ld $t4, 0($s1)
    sd $t4, a($t3)
    daddi $t3, $t3, 8
    bnez $t1, loop
    jr $ra
  
  calculo: dsub $t0, $a0, $a1  #(a-b) al cuadrado 2
    daddi $t1, $zero, 1
    loop1: dmul $t1, $t1, $t0
    daddi $a2, $a2, -1
    bnez $a2, loop1
    sd $t1, res($zero)
    daddi $t3, $zero, 2
    sd $t1, 0($s1)
    sd $t3, 0($s0)
    jr $ra

  
  
.data
  tabla: .word 10,10,3,5,6,6,7,8,9,10
  x: .word 5
  cant: .word 0
  resul: .word 0
.code
  daddi $a0, $zero, tabla
  daddi $a1, $zero, 10 #longitud
  ld $s0, x($zero)
  jal verificar
  sd $v0, cant($zero)
  daddi $a0, $zero, tabla
  daddi $a1, $zero, 10
  jal genenerarOtro

halt
  verificar: daddi $v0, $zero, 0
  loop: ld $t0, 0($a0)
    slt $t1, $t0, $s0 
    bnez $t1, noMayor
    daddi $v0, $v0, 1
    daddi $a1, $a1, -1
    daddi $a0, $a0, 8
    bnez $a1, loop
    jr $ra
    noMayor: daddi $a0, $a0, 8
    daddi $a1, $a1, -1
    bnez $a1, loop
    jr $ra
  
  genenerarOtro: daddi $s1, $zero, 0
    daddi $s2, $zero, 1
    daddi $t7, $zero, resul
  loop1: #daddi $t1, $zero, 0
    ld $t0, 0($a0)
    slt $t1, $t0, $s0
    bnez $t1, paso1
    sd $s2, 0($t7)
    daddi $t7, $t7, 8
    daddi $a1, $a1, -1
    daddi $a0, $a0, 8
    bnez $a1, loop1
    jr $ra
    paso1: beq $t0, $s0, menorIgual
    menorIgual: sd $s1, 0($t7)
      daddi $t7, $t7, 8
      daddi $a1, $a1, -1
      daddi $a0, $a0, 8
      bnez $a1, loop1
      jr $ra


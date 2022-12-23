#hallar el max y el min y guardarlo, en la variable max y min
# me salioooooooooooooooooooo 
.data
  max: .word 0
  min: .word 0
  vector: .word 1, 3, 5, 9, 8

.code
  daddi $a0, $zero, vector
  jal calculo
  sd $t0, max($zero) 
  sd $t1, min($zero)

  halt
  calculo: daddi $t0, $zero, 999
  daddi $t1, $zero, -999
  daddi $t2, $zero, 5

  lopardo: ld $t3, 0($a0)
  daddi $a0, $a0, 8
  daddi $t2, $t2, -1

  slt $t4, $t3, $t0 #a< b= t4=1
  beqz $t4, salto1
  dadd $t0, $zero, $t3 #maximo

  salto1: slt $t4, $t1, $t3 # a<b= 1 si 
  beqz $t4, casiSalgo
  dadd $t1, $zero, $t3    #minimo
  casiSalgo: bnez $t2, lopardo
  jr $ra

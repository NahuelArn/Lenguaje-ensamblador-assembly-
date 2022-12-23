#hallar el max y el min y guardarlo, en la variable max y min

.data
  valor: .word 5

.code 
  ld $t1, valor($zero)
  dadd $t2, $t3, $t4
  dmul $t5, $t6, $t7
  sd $t8, valor($zero)
  halt
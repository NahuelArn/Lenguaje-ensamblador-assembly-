.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena
.code
  daddi $t0, $zero, cadena
  lbu $s0, car($zero)
  daddi $t7, $zero, 0 #contador
  loop: lbu $t1, 0($t0)
  beq $s0, $t1, igual
  daddi $t0, $t0, 1
  bnez $t1, loop
  j fin
  igual: daddi $t7, $t7, 1
  daddi $t0, $t0, 1
  bnez $t1, loop
  fin: sd $t7, cant($zero)
  halt
#Escribir un programa que lea tres números enteros A, B y C de la memoria de datos y determine cuántos de ellos son iguales
#entre sí (0, 2 o 3). El resultado debe quedar almacenado en la dirección de memoria D.
.data
  a: .word 2
  b: .word 4
  c: .word 6
  d: .word 0
.code
  ld $t0, a($zero)
  ld $t1, b($zero)
  ld $t2, c($zero)
jal verificar
  sd $v0, d($zero)
halt
  verificar: bne $t0, $t1, noCumple1#a ⇒ b/ a⇒ c
  daddi $v0, $zero, 1
  back: bne $t0, $t2, noCumple2
  daddi $v0, $v0, 1
  
  back1: bne $t1, $t2, noCumple3
  daddi $v0, $v0, 1

  noCumple1: j back
  noCumple2: j back1
  noCumple3: jr $ra

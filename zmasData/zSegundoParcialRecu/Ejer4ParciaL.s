#Escribir un programa que lea desde teclado un numero en punto flotante y lo compare con el valor almacenado en la celda llamada Valor
#Si al valor ingresado por teclado es mayor que el almacenado en Valor debera calcular (X - Valor) * X, donde X es el numero leido por teclado.
# Caso contrario, debera calcular (Valor - x) / X por ultimo,debera imprimir el texto "El resultado es" junto con el valor calculado

.data
  Valor: .double 5.0
  #NumLeido: .double 0.0 #alpedo
  mensaje: .asciiz "el resultado es: "
  control: .word32 0x10000
  data: .word32 0x10008
.code

  lwu $s0, control($zero)
  lwu $s1, data($zero)

  #trerme mi valor actual
  l.d f1, Valor($zero)

  #leo el num
  daddi $t0, $zero, 8
  sd $t0, 0($s0)
  #cargo el num
  l.d f0, 0($s1)
  #f0 mi num p.f leido.. valor X

  #f1 valor de variable, f0 numero leido

  c.lt.d f1 ,f0 #si f1 < f0 FA =1
  bc1t option2
  # (Valor - x) / x    <->  (f1- f0) / f0
  sub.d f3, f1, f0
  div.d f4, f3, f0  

  daddi $t0, $zero, mensaje
  sd $t0, 0($s1)

  daddi $t0, $zero, 4
  sd $t0, 0($s0)

  s.d f4, 0($s1)
  daddi $t0, $zero, 3
  sd $t0, 0($s0)
  halt

  option2: sub.d f3, f0, f1 # (x - VALOR ) * X   <->  (F0- F1) * F0
  mul.d f5, f3, f0
  daddi $t0, $zero, mensaje
  sd $t0, 0($s1)

  daddi $t0, $zero, 4
  sd $t0, 0($s0)      #imprimio el mensaje

  s.d f5, 0($s1)      #mando numero para que se imprima
  daddi $t0, $zero, 3 
  sd $t0, 0($s0) 
halt


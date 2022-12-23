#escribir un programa para Winmips que lea un arreglo (tabla1) de N datos en punto flotante almacenados en la memoria y genere un segundo
#arreglo (tabla2) cuyos N-I elementos sean el promedio de cada par de datos consecutivos del arreglo original. Es decir, el primer elemento de tabla2 
# debera ser el promedio entre los elementos 1 y 2 de tabla1, el segundo elemento de tabla2 debera ser el promedio emtre los elementos 2 y 3 tabla1, etc. El calculo del promedio
#se debe realizar en una subrutina. El arreglo tabla2 debe quedar almacenado en memoria a continuacion de tabla1. Una vez generado el arreglo tabla2, todos sus elemtos deben
#visualizarse en pantalla terminal del simulador. Esto debe implementarse a traves de otra subrutina que reciba como parametro la direccion incial del arreglo.
#considere N=12.

.data 
  control: .word32 0x10000
  data: .word32 0x10008
  tres: .double 5.0 # longitud tabla tomados de a 2
  dos: .double 2.0  #divisor
  tabla1: .double 1.0, 2.0, 3.0, 4.0, 5.0, 6.0
  tabla2: .double 0.0

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $s3, $zero, 3
  l.d f2, dos($zero)
  daddi $t0, $zero, 5 #lonitud de 5 para que complicarme con un pf
  daddi $a0, $zero, tabla1
  daddi $a1, $zero, tabla2 #se vio modificada en la primer subrutina
  daddi $a2, $zero, tabla2

  jal promedio
  jal imprimir
halt

  promedio: daddi $t0, $t0, -1
    l.d f0, 0($a0)
    daddi $a0, $a0, 8
    l.d f1, 0($a0) 
    add.d f3, f1, f0
    div.d f4, f3, f2 # f4 = (suma)/2
    s.d f4, 0($a1)
    daddi $a1, $a1, 8 #avanzo en mi segundo vector
    bnez $t0, promedio
  jr $ra

  imprimir: daddi $t1, $zero, 6
  loop: daddi $t1, $t1, -1
    beqz $t1, fin
    l.d f10, 0($a2)
    s.d f10, 0($s1)
    sd $s3, 0($s0)
    daddi $a2, $a2, 8
    j loop
  fin: jr $ra

#escribir un programa que lea desde teclado un numero en punto flotante y lo compare con el valor almacenado en la celda Valor. Si el valor ingresado por teclado es menor o igual 
#que el alamceado en Valor, debera calcular (valor-X) * x, donde X es el numero leido por teclado. Caso contrario, debera calcular (valor + X)/X. Por ultimo, debera imprimir "El texto
#El restultado es: " junto con el valor calculado

#time 17:30 
.data
  control: .word32 0x10000
  data: .word32 0x10008
  texto: .asciiz "el resultado es: "
  valor: .double 2.0
.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  l.d f0, valor($zero)
  daddi $t0, $zero, 8
  sd $t0, 0($s0)
  l.d f1, 0($s1)
  #f1 num traido
  #f0 valor memoria
  jal verificar
halt
  verificar: c.le.d f1, f0
  bc1f primera
    add.d f3, f0, f1
    div.d f5, f3, f1
    daddi $t0, $zero, texto
    daddi $t1, $zero, 4
    sd $t0, 0($s1)
    sd $t1, 0($s0)
    s.d f5, 0($s1)
    daddi $t6, $zero, 3
    sd $t6, 0($s0)
  jr $ra

  primera: sub.d f3, f0, f1#(valor-x)*x
    mul.d f5, f3, f1 
    daddi $t0, $zero, texto
    daddi $t1, $zero, 4
    sd $t0, 0($s1)
    sd $t1, 0($s0)
    s.d f5, 0($s1)
    daddi $t6, $zero, 3
    sd $t6, 0($s0)
  jr $ra
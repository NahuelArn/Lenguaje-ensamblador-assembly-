.data
  poneTuNumero: .word 2
  exponente: .word 3
  resultado: .word 0
.code
  ld $t0, poneTuNumero($zero)
  ld $t1, exponente($zero)

  daddi $t3, $zero, 1
  potencia: dmul $t3, $t3, $t0
  daddi $t1, $t1, -1
  bnez $t1, potencia
  sd $t3, resultado($zero)
halt
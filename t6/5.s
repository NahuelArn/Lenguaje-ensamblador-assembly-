Escriba un programa que calcule el resultado de elevar un valor en punto flotante a la potencia indicada por un
exponente que es un número entero positivo. Para ello, en el programa principal se solicitará el ingreso de la base (un
número en punto flotante) y del exponente (un número entero sin signo) y se deberá utilizar la subrutina
a_la_potencia para calcular el resultado pedido (que será un valor en punto flotante). Tenga en cuenta que
cualquier base elevada a la 0 da como resultado 1. Muestre el resultado numérico de la operación en la salida estándar
del simulador (ventana Terminal).

.data
  #falopa
  control: .word32 0x10000
  data: .word32 0x10008
  flotante: .asciiz "ingresate un flotante: "
  exponente: .asciiz "ingresate un entero: "
  uno: .double 1.0
.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  #mando mi mensaje
  daddi $t0, $zero, flotante          #direc
  sd $t0, 0($s1)

  daddi $t2, $zero, 4
  sd $t2, 0($s0)

  #solicito el ingreso de un numero en punto flotante
  daddi $t0, $zero, 8
  sd $t0, 0($s0) 

  l.d f1, 0($s1) #cargo el numero en punto flotante
#---------------------------------------------------------
  #mando mi segundo  mensaje "entero"
  daddi $t0, $zero, exponente         #direc
  sd $t0, 0($s1)
  daddi $t2, $zero, 4
  sd $t2, 0($s0)

  #solicito el numero entero positivo (exponente)
  daddi $t0, $zero, 8
  sd $t0, 0($s0)

  ld $a0, 0($s1) # cargo el numero entero positivo

  jal a_la_potencia

halt

#f1 = base   |    # a0 = exponente
a_la_potencia: beqz $a0, casiFin
l.d f2, uno($zero)  #f2 = 1.0
lopardo: mul.d f2, f2, f1 
  daddi $a0, $a0, -1
  bnez $a0, lopardo
#imprimimos
s.d f2, 0($s1)
daddi $t3, $zero, 3 #imprimir  numero en punto flotante
sd $t3, 0($s0)
jr $ra

#tengo que imprimir el 1
casiFin: daddi $t0, $zero, 6
  sd $t0, 0($s0)

  daddi $t3, $zero, 1
  sd $t3, 0($s1) #cargo mi numero entero positivo   data

  daddi $t1, $zero, 1
  sd $t1, 0($s0) #le mando un 1 a control..... imprimir numero en entero

jr $ra
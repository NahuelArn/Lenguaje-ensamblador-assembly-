#escribir un programa que permita. Ingresar 5 caracteres por teclado. mostrando el mensaje "Ingrese 5 caracteres a buscar en la cadena", por cada uno de ellos debe invocar
# a una subrutina CONTAR que recibe la direccion de comienzo de la cadena y el caracter ingresado, la misma debe devolver la cantidad de ocurrencias del caracter en la cadena.
#Los valores retornados se deben almacenar en una tabla en memoria

.data
  texto: .asciiz "aen esta cadena busco ocurrencias de un caracter"
  mensaje: .asciiz "Ingresar 5 caracterres a buscar en la cadena"

  control: .word32 0x10000
  data: .word32 0x10008

  tabla: .word 0

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $s3, $zero, mensaje
  daddi $s2, $zero, 9
  daddi $s4, $zero, 4
  daddi $a1, $zero, texto

  daddi $t6, $zero, tabla
  daddi $t7, $zero, 5
loop: daddi $t7, $t7, -1
  beqz $t7, finn
  sd $s3, 0($s1)
  sd $s4, 0($s0) #imrpime

  sd $s2, 0($s0)
  lbu $a0, 0($s1) #me traje el caracter que me ingresaron
  jal contar
  sd $v0, 0($t6)
  daddi $t6, $t6, 8
  j loop
finn: halt


  #a0 =caracter ingresado
  #a1 = direc de cadena
  contar: daddi $v0, $zero, 0 #inciazliza en 0
    daddi $t0, $zero, texto    #a1 = direc texto
  loop1: lbu $t1, 0($t0)   #me traigo el caracter actual
    beqz $t1, fin       #si es 0 termino
    bne $a0, $t1, casifin #comparo si son iguales, si no cumple incremento t0 y salto a loop
    daddi $v0, $v0, 1   #cumplio summo 1 a mi contador
    daddi $t0, $t0, 1   #incremento mi desplazamiento
    j loop1

  casifin: daddi $t0, $t0, 1
  j loop1
  fin: jr $ra


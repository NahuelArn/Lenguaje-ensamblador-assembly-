#escribir un programa que permita. Ingresar 5 caracteres por teclado. mostrando el mensaje "Ingrese 5 caracteres a buscar en la cadena", por cada uno de ellos debe invocar
# a una subrutina CONTAR que recibe la direccion de comienzo de la cadena y el caracter ingresado, la misma debe devolver la cantidad de ocurrencias del caracter en la cadena.
#Los valores retornados se deben almacenar en una tabla en memoria

.data
  texto: .asciiz "aaa"
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
    daddi $t0, $zero, 0    #a1 = direc texto
  loop: lbu $t1, texto($t0)   #me traigo el caracter actual
    beqz $t1, fin       #si es 0 termino
    bne $a0, $t1, casifin #comparo si son iguales, si no cumple incremento t0 y salto a loop
    daddi $v0, $v0, 1   #cumplio summo 1 a mi contador
    daddi $t0, $t0, 1   #incremento mi desplazamiento
    j loop

  casifin: daddi $t0, $t0, 1
  j loop
  fin: jr $ra




#primero EXPLICADO sin optimizacion
#con forwardin
#algoritmo de parcial 
.data
	text: .asciiz "ejercicio falopaaaaaa"
	car: .asciiz "a"
	cant: .word 0 #cantidad de veces que aparece la letra a
.code
  lbu r1, car(R0) #cargo en r1 el caracter a buscar
	daddi R10, R0, text #cargo en r10 la direccion de memoria de text

	dadd R25, R0, R0 #este va a ser mi contador de las veces q aparecio la "a" despues lo tengo que pasar a cant
	
	#lbu R5, text(R7) este seria mi instruccion de for, esta bien pero se puede hacer asi
	#r5 tiene mi caracter en ascci
	
	LOPARDO: lbu R5, 0(R10) #R10 ES MI PUNTERO (quiero cargar un caracter) de 8 bits, un byte
		beqz r5, salida
		#al registro R10 vamos ir moviendo (desplazamiento) y 0 para que se quede en la posicion que este en ese momento r10
		bne R1, R5, NOENCUENTRA #si no es igual a la letra a, salta a la etiqueta NOENCUENTRA
		daddi R25, R25, 1 #si es igual, incremento el contador
	NOENCUENTRA: daddi R10, R10, 1 #incremento el puntero
		j LOPARDO #salto a la etiqueta LOPARDO
salida: sd r25, cant(R0) #guardo las veces que se repite la letra a en la variable cant
halt
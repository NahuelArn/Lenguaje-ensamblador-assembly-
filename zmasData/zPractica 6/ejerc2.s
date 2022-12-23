.data 
	control: .word32 0x10000		#control
	data: .word32 0x10008				#data
	noDig: .asciiz "el caracter ingresado no es un digito"
	salto: .byte 10
	zeero: .asciiz "cero    "
	one: .asciiz 	 "UNO     "
	two: .asciiz 	 "DOS     "
	three: .asciiz "TRES    "
	four: .asciiz	 "CUATRO  "	
	five: .asciiz	 "CINCO   "
	six: .asciiz	 "SEIS    "
	seven: .asciiz "SIETE   "
	eight: .asciiz "OCHO    "
	nine: .asciiz	 "NUEVE   "
	num: .asciiz ""
.code
	daddi $sp, $sp, 0x400		#le doy una direccion a mi pila

	lwu $s0, control($zero) #cargo el valor de control en $s0
	lwu $s1, data($zero)		#cargo el valor de data en $s1
	daddi $s3, $zero, num
	jal ingreso

	halt

	ingreso: daddi $sp, $sp, -8	#reservo espacio para el retorno
		sd $ra, 0($sp)		#guardo el retorno

		a:
		daddi $t1, $zero, 9 	# voy a pedir un caracter
		sd $t1, 0($s0)		#guardo el valor en el registro de control (pido caracter)
		lbu $t2, 0($s1) #cargo mi caracter en t2
		sd $t2, num($zero) #cargo el carac en la pos, de num

		daddi $t3, $zero, num #me traigo la direc de num
		sd $t3, 0($s1) #le mando la direc a data  

		daddi $t7, $zero, 4 #cod 4 de imprimir
		sd $t7, 0($s0) #control recibe 4 y escribe el mensaje

		#los t q se me habilitan
		#t1, t2, t4, t3
		verificador: ld $t1, num($zero) #cargo el caracter en t3
		slti $t2, $t1, 48 #comparo si es menor a 48
		bnez $t2, noCumple #si es menor, me va a setear el t2 con 1 y no cumplir
		slti $t2, $t1, 57 #si es menor, me setea el t2 en 1 y me sirve porq va entar en el rango de los numeros
		beqz $t2, noCumple #si es 0, no cumple

		daddi $a1, $zero, zeero #cargo la direccion de zero

		#ahora llamo a la subrutina para imprimir el numero en letras
		jal magia #llamo a la subrutina magia

		ld $ra, 0($sp) #recupero el valor de la pila 
		daddi $sp, $sp, 8 #libero el espacio de la pila

		jr $ra #retorno

		          #obtengo la direc de la cadena
		noCumple: daddi $t0, $zero, noDig

		sd $t0, 0($s1) #le mando la direc a data
		#limpio consola
		daddi $t3, $zero, 6 #cod 4 de limpiar consola
		sd $t3, 0($s0) #control recibe 4 y limpia el caracter
		#imprimo mensaje "no es un digito"
		daddi $t7, $zero, 4 #cod 4 de imprimir
		sd $t7, 0($s0) #control recibe 4 y escribe el mensaje

		jr $ra #retorno #si pasa esto nunca entro a la segunda subrutina anidada asiq todo good


		# $t1 tiene mi numero
		magia: daddi $t2, $zero, 0x30 #t2 es el contador
		daddi $t1,  $t1, 0x30 #le sumo 30 para que me de el numero en decimal
		lopardo: beq $t1, $t2, impresora #beqz $t1, impresora
		#beq $t1, $t2, impresora
		  daddi $t1, $t1, -1
			daddi $a1, $a1, 8 
			j lopardo

		impresora: sd $a1, 0($s1) #le mando la direc a data
		daddi $t7, $zero, 4 #cod 4 de imprimir
		sd $t7, 0($s0) #control recibe 4 y escribe el mensaje
		jr $ra
		#data direc
		#control num 

		#SALTO DB 0AH 
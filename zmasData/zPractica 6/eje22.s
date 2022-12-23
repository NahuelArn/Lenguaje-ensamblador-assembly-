.data 
	control: .word32 0x10000		#control
	data: .word32 0x10008				#data
	noDig: .asciiz " <--- el caracter ingresado no es un digito"
	cero: .asciiz  "CERO    "
	one: .asciiz 	 "UNO     "
	two: .asciiz 	 "DOS     "
	three: .asciiz "TRES    "
	four: .asciiz	 "CUATRO  "	
	five: .asciiz	 "CINCO   "
	six: .asciiz	 "SEIS    "
	seven: .asciiz "SIETE   "
	eight: .asciiz "OCHO    "
	nine: .asciiz	 "NUEVE   "
	num: .byte 0
	#num: .asciiz ""
.code
	lwu $s0, control($0)		#cargo el valor de control en $s0
	lwu $s1, data($0)			#cargo el valor de data en $s1
	lopardo: nop
	jal ingreso
	jal definir
	j lopardo
halt

	ingreso: daddi $t0, $zero, 9		#cargo el valor 9 en $t0, para leer un caracter
	sd $t0, 0($s0) #cargo el codigo para indicar que voy a pedir un CARACTER
	
	lbu $t1, 0($s1)		#cargo el caracter ingresado en $t1
	sb $t1, num($zero)
	#sd $t1, num($zero) #cargo mi caracter en la variable num

	#registros usados t1, t2,t3,t4,t5,

	#veo que caracter toque... pero primero limpio la consola
	daddi $t6, $zero, 6 #cod para limpiar la consola
	sd $t6, 0($s0) #cargo el codigo para limpiar la consola

	daddi $s3, $zero, num #cargo la direccion de "num" en $s3
	sd $s3, 0($s1) #cargo la direccion de "num" en la variable data
	daddi $t2, $zero, 4 #cargo el codigo para imprimir un string
	sd $t2, 0($s0) #cargo el codigo en imprimir en control

	#etapa de verificacion
	verificacion: ld $v0, num($zero) #me traigo el valor el valor de num a $v0
	slti $t3, $v0, 48 #comparo si el valor es menor a 48.. valor >= 0
	bnez $t3, noCumple
	slti $t3, $v0, 57 #comparo si el valor es menor a 57 osea.. valor <10
	beqz $t3, noCumple
	jr $ra

	noCumple: daddi $t5, $zero, noDig #cargo la direccion de "noDig" en $t5
	sd $t5, 0($s1) #le mando a data la direccion de no dig	
	sd $t2, 0($s0) #cargo el codigo para imprimir el mensaje... 

	j ingreso #si no es el un numero dentro del rango, pido otro caracter

	#registros usados t6,t7
	definir: daddi $t6, $zero, cero #cargo la direccion de "cero" en $t6
	  daddi $t7, $zero, 0x30 #cargo el valor 0x30 en $t7, que seria el 0 en hexadecimal
		loop:	beq $v0, $t7, imprimir #comparo si el valor ingresado es igual a 0x30
			daddi $v0, $v0, -1 #si no es igual, le resto 1 al valor ingresado
			daddi $t6, $t6, 8 #si no es igual, le sumo 8 a la direccion de cero
			j loop #vuelvo a comparar
		imprimir: sd $t6, 0($s1) #cargo la direccion de cero en data
			sd $t2, 0($0) #imprimo el string equivalente al numero
	jr $ra
	#lop: j lop

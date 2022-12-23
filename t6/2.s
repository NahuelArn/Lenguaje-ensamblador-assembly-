Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el
ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La
segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del
número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje
de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones
del cauce (ejercicio similar al ejercicio 6 de Práctica 2).


.data 
	control: .word32 0x10000		#control
	data: .word32 0x10008				#data
	zero: .asciiz  "cero"
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

		j a

		#data direc
		#control num
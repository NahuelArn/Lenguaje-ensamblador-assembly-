.data
	numPosM: .word 3
	tabla: .word 1,2,3,4,6
	cant_Tabla: .word 5

	cantMayor: .word 0


.code
  jal creacionPila

	daddi $a0, $zero, tabla #paso la direccion a la subrutina
	jal subDpush #llamo a la subrutina PUSH

	ld $a0, numPosM($zero) #paso el numero con lo que voy a comparar en mi array
	jal subDpush #llamo a la subrutina PUSH

	ld $a0, cant_Tabla($zero) #paso la cantidad de elementos de mi array
	jal subDpush #llamo a la subrutina PUSH

	jal verificador #llamas a la subrutina 

	sd $v0, cantMayor($zero) #guardo el resultado en la variable cantMayor
	#aca voy a guardar la cantidad y termino todo pal carajo
halt
	


	creacionPila: daddi $sp, $zero, 0x4000 #creo mi pila en la direccion 4000h
		jr $ra #vuelvo al programa principal
	subDpush: daddi $sp, $sp, -8 #creo espacio para el dato
		sd $a0, 0($sp) #guardo el dato en la pila
		jr $ra #vuelvo al programa principal
	
	subDpop: ld $t0, 0($sp)	#primer pop  $t0 CANT_TABLA
		daddi $sp, $sp, 8

		ld $t1, 0($sp)			#segundo pop	 $t1 NUM_POS_M
		daddi $sp, $sp, 8

		ld $t2, 0($sp)			#tercer pop    $t2 TABLA DIRECCION
        #		ld $t2, 0($sp)			#tercer pop    $t2 TABLA DIRECCION
		daddi $sp, $sp, 8
		jr $ra

	verificador: jal subDpop #llamo a la subrutina POP
		dadd $v0, $zero, $zero #inicializo mi contador retornador de subrutinas
		Lopardo: slt $t5, $t2, $t1 #si t2 < t1 no salto
		bnez $t5, no_salto
		daddi  $v0, $v0, 1 #sumo 1 al contador... la numero del array es mayor q M
		no_salto: daddi $t2, $t2, 8 #incremento la direccion del array
		daddi $t0, $t0, -1 #decre,emtp cant_tabla, direccion del array
		bnez $t0, Lopardo #si t0 != 0 salto a Lopardo
		jr $ra #vuelvo al programa principal





.data
num: .word 4
tabla: .word 1, 2, 3, 4, 5
longitud: .word 5
resultado: .word 0

.code
ld $a0, num($0)			; $a0 = 4 
daddi $a1, $0, tabla	; $a1 = puntero a tabla
ld $a2, longitud($0)	; $a2 = 5 (longitud)
jal subrutina
sd $v0, resultado($0)
halt

subrutina:	dadd $v0, $0, $0	; inicio valor de retorno (contador)
dadd $t0, $0, $0				; $t0 = desplazamiento

loop: ld $t1, 0($a1)			; $t1 = elem. de la tabla
slt $t2, $t1, $a0				; si $t1 < $a0 entonces $t2 = 1
bnez $t2, menor					; si es menor salto
beq $t1, $a0, menor				; si es igual salto

daddi $v0, $v0, 1				; aumento valor de retorno (contador)

menor: daddi $a1, $a1, 8		; aumento el desplazamiento
daddi $a2, $a2, -1				; disminuyo la longitud
bnez $a2, loop

jr $ra

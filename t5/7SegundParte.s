Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una
tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla.
La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.


.data
	numM: .word 2
	tabla: .word 1,2,3,1,5
	longitud: .word 5
	cantMayor: .word 0

.code
	daddi $a0, $zero, tabla	# puntero a tabla
	ld $a1, numM($zero)
	ld $a2, longitud($zero)
	#llamo a subrutina
	jal verificador
	sd $v0, cantMayor($zero) #guardo el resultado en cantMayor
halt

verificador: daddi $v0, $zero, 0 #inicializo el contador 
	dadd $t1, $zero, $a1 #cargo el valor de numM en $t1
# $t0 = tabla
# $t1 = numM
loopardo: ld $t0, 0($a0) #cargo el valor de la tabla en $t0
	
	# SI NUM ES MAYOR Q TABLA PONE UN 1
	# tabla < numM.....$t2 = 1
	slt $t2, $t0, $t1 #comparo si el valor de la tabla es menor que numM
	beqz $t2, menor	#si es 0, salto a menor JZ
	daddi $a0, $a0, 8 
	daddi $v0, $v0, 1 #incremento el contador
	daddi $a2, $a2, -1 #decremento la longitud
	bnez $a2, loopardo #si longitud es distinto de 0, vuelvo a loopardo

	jr $ra #retorno

menor: daddi $a0, $a0, 8 #incremento el puntero a tabla
	daddi $a2, $a2, -1 #decremento la longitud
	bnez $a2, loopardo #si longitud es distinto de 0, vuelvo a loopardo

	jr $ra #retorno
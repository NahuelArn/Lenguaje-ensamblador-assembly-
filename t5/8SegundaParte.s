Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y
retorne la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe retornar -1.

.data
  cadena: .asciiz "sarasa" 
	cadena2: .asciiz "sarasa"
	posicionDif: .word 0
	iguales: .word 0
.code
	daddi $sp, $sp, 0x400		#le doy una direccion a mi pila

	#traermes losd datos de las variables
	daddi $a0, $zero, cadena
	daddi $a1, $zero, cadena2 
	jal validador
	sd $v0, posicionDif($zero) # guardo mi resultado de posicion
	sd $v1, iguales($zero) # guardo mi resultado de si son iguales

halt
	validador: dadd $v0, $zero, $zero
	daddi $v0, $zero, 1 #para q me coincidan las posiciones a partir del 1
	lopardo: lbu $t0, 0($a0) #cargo el primer caracter de la cadena
	lbu $t1, 0($a1) #cargo el primer caracter de la cadena2
	#verifico que no sea 0
	beqz $t0, fin #si es 0 es porque llegue al final/vacia de la cadena
	beqz $t1, fin #si es 0 es porque llegue al final/vacia de la cadena2
	#verifico que sean iguales
	bne $t0, $t1, retorno #si no son iguales termino
	daddi $v0, $v0, 1 #si son iguales sumo 1 al contador
	#me desplazo 1
	daddi $a0, $a0, 1
	daddi $a1, $a1, 1
	j lopardo

	fin: bne $t0, $t1, retorno #si NO SON iguales TERMINA TDO PAL CARJO
	daddi $v1, $zero,-1 #si son iguales sumo 1 al contador
	retorno: jr $ra
.data
	control: .word32 0x10000 #control 
	data: .word32 0x10008  #data
	num: .word 0
	num2: .word 0
	result: .word 0

.code
	lwu $s0, control($zero) # cargo el valor de control en $s0
	lwu $s1, data($zero) # cargo el valor de data en $s1

	jal ingreso
	jal resultado

halt
	ingreso: daddi $t0, $zero, 8 # cargo el cod de pedir un numero 
	sd $t0, 0($s0)
	ld $v0, 0($s1) # cargo en $v0 el numero1 que acabo de leer

	sd $t0, 0($s0) #pido otro digito
	ld $v1, 0($s1) # cargo en $v0 el numero2 que acabo de leer

	jr $ra

  resultado: dadd $a1, $v1, $v0 # sumo los dos numeros

	sd $a1, result($zero) # guardo el resultado en result	
	
	
	sd $a1, 0($s1)
	daddi $t1, $zero, 1
	sd $t1, 0($s0) # envio el cod de imprimir el resultado)

	jr $ra


	mio r14 , direc letra a imprimir

del otro

r5

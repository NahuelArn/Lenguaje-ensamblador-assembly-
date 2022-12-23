.data  
	control: .word32 0x10000
	data: .word32 0x10008
	texto: .asciiz ""
.code
	#me traigo a un registro, data y control
	lwu $s0, data($zero)	
	lwu $s1, control($zero)

	daddi $s4, $zero, 48 #el 0 en ascii
	daddi $t8, $zero, texto #me traigo la direccion de texto

	jal pedir

	halt 

	pedir: daddi $t0, $zero, 9
	sd $t0, 0($s1) #me quedo en la espera, al usuario q ingrese un caracter

	lbu $t5, 0($s0) #cargo en t5 mi caracter
	
	beq $t5, $s4, fin #si es 0, salgo de la subrutina 

	sb $t5, 0($t8) #guardo el caracter en texto 
	
	sd $t8, 0($s0) #le mando la direc a data

	daddi $t7, $zero, 4
	sd $t7, 0($s1) #control recibe 4 y escribe el mensaje

	daddi $t8, $t8, 1 #me muevo a la siguiente posicion

	j pedir

	fin: jr $ra

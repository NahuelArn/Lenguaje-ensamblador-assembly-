El siguiente programa produce la salida de un mensaje predefinido en la ventana Terminal del simulador
WinMIPS64. Teniendo en cuenta las condiciones de control del puerto de E/S (en el resumen anterior), modifique el
programa de modo que el mensaje a mostrar sea ingresado por teclado en lugar de ser un mensaje fijo.

.data 
texto: .asciiz "Hola, Mundo!" ; El mensaje a mostrar
CONTROL: .word32 0x10000 
DATA: .word32 0x10008 
 
.text 
lwu $s0, DATA($zero) ; $s0 = dirección de DATA

daddi $t0, $zero, texto ; $t0 = dirección del mensaje a mostrar
sd $t0, 0($s0) ; DATA recibe el puntero al comienzo del mensaje
lwu $s1, CONTROL($zero) ; $s1 = dirección de CONTROL

daddi $t0, $zero, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica 
sd $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla

daddi $t0, $zero, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje
halt



pedis numeros y una vez q pones un 0 imprime en consola

.data  
	control: .word32 0x10000
	data: .word32 0x10008
	texto: .asciiz ""
.code
	lwu $s0, data($zero)
	lwu $s1, control($zero)
	daddi $s4, $zero, 48
	daddi $t8, $zero, texto #me traigo la direccion de texto

	jal pedir

	daddi $t0, $zero, 6
	sd $t0, 0($s1) #control recibibe 6 y limpia la pantalla

	daddi $t1, $zero, texto #me vuelvo a parar en el princio de texto para imprimir todo hasta un 0
	sd	$t1, 0($s0) #LE MANDO LA DIRECCION A DATA

	daddi $t0, $zero, 4
	sd $t0, 0($s1) #control recibe 4 y escribe el mensaje
	halt 

	pedir: daddi $t0, $zero, 9
	sd $t0, 0($s1) #me quedo en la espera, al usuario q ingrese un caracter

	lbu $t5, 0($s0) #cargo en t5 mi caracter
	
	beq $t5, $s4, fin #si es 0, salgo de la subrutina 

	sb $t5, 0($t8) #guardo el caracter en texto 

	daddi $t8, $t8, 1 #me muevo a la siguiente posicion

	j pedir

	fin: jr $ra
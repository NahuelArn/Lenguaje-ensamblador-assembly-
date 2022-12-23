.data
	numPosM: .word 0
	tabla: .word 1,2,3,4,5
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
		daddi $sp, $sp, 8
		jr $ra

	verificador: jal subDpop #llamo a la subrutina POP
		dadd $v0, $zero, $zero #inicializo mi contador retornador de subrutinas
		Lopardo: slt $t5, $t2, $t1 #si t2 < t1 no salto
		bnez $t5, no_salto
		daddi  $v0, $v0, 1 #sumo 1 al contador... la numero del array es mayor q M
		no_salto: daddi $t2, $t2, 8
		daddi $t0, $t0, -1 #incremento la direccion del array
		bnez $t0, Lopardo #si t0 != 0 salto a Lopardo
		jr $ra #vuelvo al programa principal



cosas q tengo
 direccion de te tabla
 numero M
 cant tabla a pushear










	.data
	numPosM: .word 0
	tabla: .word 1,2,3,4,5
	cant_Tabla: .word 5

	cantMayor: .word 0

creacionPila: daddi $sp, $zero, 0x4000 #creo mi pila en la direccion 4000h
jr $ra #vuelvo al programa principal
subDpush: daddi $sp, $sp, -8 #creo espacio para el dato
sd $a0, 0($sp) #guardo el dato en la pila
jr $ra #vuelvo al programa principal
subDpop: 

verificador: 

.code
  jal creacionPila
	ld $a0, tabla(tabla) #paso la direccion a la subrutina
	jal subDpush #llamo a la subrutina PUSH
	ld $a1, numPosM($zero) #paso el numero con lo que voy a comparar en mi array
	
	jal verificador #llamas a la subrutina 

	#aca voy a guardar la cantidad y termino todo pal carajo
	halt
	





	.data
    M: .word 3
    TABLA: .word 1,2,3,4,5
    RESULTADO: .word 0
.code
    ld $a0, M(r0)           ; a0 = 14
    daddi $a1, $0, 5        ; a1 = cantidad de elementos
    daddi $a2, $0, TABLA    ; a2 = paso la direccion de TABLA
    jal VALORES             ; salto a la rutina y guardo la direccion de retorno
    nop                     ; pinto
    sd $v0, RESULTADO($0)   ; VALORES de retorno de la subrutina, lo guardo en RESULTADO
    halt

VALORES: dadd $t0, $a1, $0              ; guardo 5 en el registro temporal
    dadd $v0, $0, $0                    ; inicializo v0
    LOOP: ld $t4, 0($a2)                ; copia en el registro temporal el primer elemento de la TABLA
        slt $t2, $t4, $a0               ; si t4 es menor que a0, entonces dejo 1 en t2
        bnez $t2 ,NO_INCREMENTAR        ; si t2 <> 0 entonces salto a NO_INCREMENTAR
        beq $t4, $a0, NO_INCREMENTAR    ; Si es igual, no incremento
        daddi $v0, $v0, 1               ; aumento el contador 
    NO_INCREMENTAR: daddi $a2, $a2, 8   ; avanzo en la tabla
        daddi $t0, $t0, -1              ; decremento el contador de elementos de tabla
        bnez $t0, LOOP                  ; si t0 <> 0 salto a loop
        jr $ra                          ; vuelve al programa principal
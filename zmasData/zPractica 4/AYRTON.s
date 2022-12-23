.data
cadena: .asciiz "adbdcdedfdgdhdid" 	; cadena a analizar
car: .asciiz "d" 					; caracter buscado
cant: .word 0 						; cantidad de veces que se repite el caracter car en cadena.

.code
lbu r1, cadena(r0) 	; guardo la primera posicion de la cadena en r1
lbu r2, car(r0) 	; guardo la "d" para comparar en r2
dadd r3, r0, r0 	; r3 = 0
daddi r4, r0, 1 	; r4 = 1 (desplazamiento dentro de la cadena)


loop: beqz r1, fin				; si r1 = 0 FIN
bne r1, r2, distintos			; si r1!=r2 DISTINTOS
daddi r3, r3, 1					; al ser iguales r3 = r3 + 1

distintos: lbu r1, cadena(r4)	; paso al proximo caracter de la cadena
daddi r4, r4, 1					; para aumentar el desplazamiento
j loop

fin: halt
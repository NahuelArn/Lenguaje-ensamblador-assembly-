Escribir un programa que lea tres números enteros A, B y C de la memoria de datos y determine cuántos de ellos son iguales
entre sí (0, 2 o 3). El resultado debe quedar almacenado en la dirección de memoria D.

#only forwarding
#ESTE PROGRAMA COMPARA 3 VARIABLES, SI SON IGUALES Y LLEVA UN CONTADOR DE LAS
#VECES QUE SE REPITE 
.data
NUM_A: .word 2
NUM_B: .word 2  #cambiar esto para probar A,B,C 
NUM_C: .word 2
RESULT_D: .word 0 #asi se pone cuando no se le asigna nada, seria como el ? de Asambler

.code
	ld R1, NUM_A(R0) #carga el valor de NUM_A en R1
	ld R2, NUM_B(R0) #carga el valor de NUM_B en R2
	ld R3, NUM_C(R0) #carga el valor de NUM_C en R3
	ld R4, RESULT_D(R0) #carga el valor de RESULT_D en R4


	#tengo que hacer primero A=B? Y A=C?
	#DESPUES B= C? Y TERMINARIA.. 
	#CON EL RESULTADO CREO QUE SE REFIRE A CUANTAS VECES ENCONTRE ALGUN REPETIDO
	
	#ROADMAP
	#CMP NUM_A, NUM_B  / r1, r2
	#JZ SALTO_ASUBRUTINAOK Y REGRESO

	#CMP NUM_A, NUM_C  / r1, r3
	#JZ SALTO_ASUBRUTINAOK Y REGRESO

	#CMP NUM_B, NUM_C r2, r3
	#JZ SALTO_ASUBRUTINAOK Y REGRESO 
	#HALT
	beq R1, R2, SALTO_ASUBRUTINAOK #si R1 y R2 son iguales, salta a SALTO_ASUBRUTINAOK
	backear: beq R1, R3, SALTO_ASUBRUTINAOK2 #si R1 y R3 son iguales, salta a SALTO_ASUBRUTINAOK
	backear2: beq R2, R3, SALTO_ASUBRUTINAOK3 #si R2 y R3 son iguales, salta a SALTO_ASUBRUTINAOK
	backear3: sd R4, RESULT_D(R0) #guarda el valor de R4 en RESULT_D
	halt 
	#ESPECIE DE SUBRUTINAS
 SALTO_ASUBRUTINAOK: daddi R4, R4, 1 #R4 = R4 + 1 (contador de veces que aparece un repetido)
 j backear #salta incondicional a backear 
 SALTO_ASUBRUTINAOK2: daddi R4, R4, 1 #R4 = R4 + 1 (contador de veces que aparece un repetido)
 j backear2 #salta incondicional a backear2
 SALTO_ASUBRUTINAOK3: daddi R4, R4, 1 #R4 = R4 + 1 (contador de veces que aparece un repetido)
 j backear3 #salta incondicional a backear3
#FIN: HALT



#only forwarding
#ESTE PROGRAMA COMPARA 3 VARIABLES, SI SON IGUALES Y LLEVA UN CONTADOR DE LAS
#VECES QUE SE REPITE 
.data
NUM_A: .word 2
NUM_B: .word 2  #cambiar esto para probar A,B,C 
NUM_C: .word 2
RESULT_D: .word 0 #asi se pone cuando no se le asigna nada, seria como el ? de Asambler

.code
	ld R1, NUM_A(R0) #carga el valor de NUM_A en R1
	ld R2, NUM_B(R0) #carga el valor de NUM_B en R2
	ld R3, NUM_C(R0) #carga el valor de NUM_C en R3
	ld R4, RESULT_D(R0) #carga el valor de RESULT_D en R4

	beq R1, R2, SALTO_ASUBRUTINAOK #si R1 y R2 son iguales, salta a SALTO_ASUBRUTINAOK
	backear: beq R1, R3, SALTO_ASUBRUTINAOK2 #si R1 y R3 son iguales, salta a SALTO_ASUBRUTINAOK
	backear2: beq R2, R3, SALTO_ASUBRUTINAOK3 #si R2 y R3 son iguales, salta a SALTO_ASUBRUTINAOK
	backear3: sd R4, RESULT_D(R0) #guarda el valor de R4 en RESULT_D
	halt 
	#ESPECIE DE SUBRUTINAS
 SALTO_ASUBRUTINAOK: daddi R4, R4, 1 #R4 = R4 + 1 (contador de veces que aparece un repetido)
 j backear #salta incondicional a backear 
 SALTO_ASUBRUTINAOK2: daddi R4, R4, 1 #R4 = R4 + 1 (contador de veces que aparece un repetido)
 j backear2 #salta incondicional a backear2
 SALTO_ASUBRUTINAOK3: daddi R4, R4, 1 #R4 = R4 + 1 (contador de veces que aparece un repetido)
 j backear3 #salta incondicional a backear3
#FIN: HALT
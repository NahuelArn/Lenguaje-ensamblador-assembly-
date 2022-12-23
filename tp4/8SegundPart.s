Escribir un programa que multiplique dos números enteros utilizando sumas repetidas (similar a Ejercicio 6 o 7 de la Práctica
1). El programa debe estar optimizado para su ejecución con la opción Delay Slot habilitada.

.data
NUM1: .word 1
NUM2: .word 2
RESULT: .word 0
CANT: .word 2 #cantidad de veces a sumar (cant a multiplicar)
.code   #PROCESO DE CARGADO DE DATOS
ld R1, NUM1(R0)
ld R2, NUM2(R0)
ld R3, RESULT(R0)
ld R4, CANT(R0)
LOPARDO: dadd R3, R1, R2 #Hago la sumaxD
	daddi R4, R4, -1 #resto 1 a la cantidad
	bnez R4, LOPARDO #Si no es 0, vuelvo a sumar
	sd R3, RESULT(R0) #Guardo el resultado #DELAY SLOT ACA, VA A SALTAR EN CADA PASADA GUARDIARIA EL RESULTADO
halt

#se podria tener a result directamente en un registro y cant en otro
#cosa de ahorrarme algo de memoria, pero no se si es necesario o serviria
#despues no veo que cambio podria hacer para tener mejor performance de CPI
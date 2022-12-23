.data
	text: .asciiz "ejercicio falopaaaaaa"
	car: .asciiz "a"
	cant: .word 0 #cantidad de veces que aparece la letra a
.code
  lbu r1, car(R0) #cargo en r1 el caracter a buscar
	daddi R10, R0, text #cargo en r10 la direccion de memoria de text

	dadd R25, R0, R0 #este va a ser mi contador de las veces q aparecio la "a" despues lo tengo que pasar a cant
	
	#lbu R5, text(R7) este seria mi instruccion de for, esta bien pero se puede hacer asi
	#r5 tiene mi caracter en ascci
	
	LOPARDO: lbu R5, 0(R10) #R10 ES MI PUNTERO (quiero cargar un caracter) de 8 bits, un byte
		beqz r5, salida
		#al registro R10 vamos ir moviendo (desplazamiento) y 0 para que se quede en la posicion que este en ese momento r10
		bne R1, R5, NOENCUENTRA #si no es igual a la letra a, salta a la etiqueta NOENCUENTRA
		daddi R25, R25, 1 #si es igual, incremento el contador
	NOENCUENTRA: daddi R10, R10, 1 #incremento el puntero
		j LOPARDO #salto a la etiqueta LOPARDO
salida: sd r25, cant(R0) #guardo las veces que se repite la letra a en la variable cant
halt 


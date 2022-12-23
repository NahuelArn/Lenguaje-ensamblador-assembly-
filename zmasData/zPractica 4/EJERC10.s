.data
	text: .asciiz "ejercicio falopaaaaaa"
	car: .asciiz "a"
	cant: .word 0 
.code
  lbu r1, car(R0) 
	dadd R25, R0, R0 
	daddi R10, R0, text  
	LOPARDO: lbu R5, 0(R10) 
		beqz r5, salida
		bne R1, R5, NOENCUENTRA 
		daddi R25, R25, 1 
	NOENCUENTRA: daddi R10, R10, 1 
		j LOPARDO 
salida: sd r25, cant(R0) 
halt 

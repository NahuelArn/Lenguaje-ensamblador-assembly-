.data
	A: .word 1
	X: .word 2
	Y: .word 3
	RESULT: .word 0
.code
	ld R1, X(R0)
	ld R2, Y(R0)
	ld R3, A(R0)

LOOP: beqz R1, FIN
	dadd R2, R2, r3
	#daddi R1, R1, -1 #Delay slot
j LOOP
daddi R1, R1, -1 #Delay slot
FIN: halt
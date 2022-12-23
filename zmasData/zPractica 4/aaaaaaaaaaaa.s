.data
    TABLA: .word 1,2,3,4,5,6,7,8,9,10
    CANT: .word 0
    NUM_X: .word 5
    LONG: .word 10
    TABLARESUL: .word 0
.code 

    ld R1, TABLA(R0) #TABLA I
    ld R2, TABLARESUL(R0) #TABLA II
    ld R3, CANT(R0) #CANTIDAD DE ACIERTOS
    ld R10, NUM_X(R0)   #numero x a comparar
    ld R15, LONG(R0)    #longitud de la tabla

    daddi R4, R0, 0 # 0 o 1

    daddi R6, R0, 0 #ESTE VA A SER MI DESPLAZMIENTO TABLA
    daddi R7, R0, 0 #ESTE VA A SER MI DESPLAZMIENTO TABLARESUL

    #comparo el primer elemento de la tabla con el numero x
    # if r10> r1
    #salto a una especie de subrutina que pone en 1, mi vector de aciertos
LOPARDO: slt R4, R1, R10 #COMPARO ([BX][I]>5) R4=1,0
    sd R4, TABLARESUL(R2) #guardp en la tabla de resultados 0 o 1
    beqz R4, CANT_NOSUM #si r4 es 0, no sumo
    daddi R3, R3, 1 #SUMO 1 A MI CONTADOR DE ACIERTOS
CANT_NOSUM: daddi R6, R6, 8 #incremento el desplazamiento TABLA
    daddi R7, R7, 8 #incremento el desplazamiento TABLARESUL
    ld R1, TABLA(R6) #CARGO EL SIGUIENTE ELEMENTO DE LA TABLA
    daddi R2, R2, 8 #incremento el desplazamiento TABLARESUL
    daddi R15, R15, -1 #DECREMENTO DE LONGITUD
beq R15, r0, FIN #si llego a 0, termino el programa
j LOPARDO
FIN: halt
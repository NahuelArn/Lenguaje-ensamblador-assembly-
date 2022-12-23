ORG 1000H
 NUM1 DW 8
 NUM2 DW 2
 RESULT DW 0

ORG 3000H

SUBDIV: MOV BX, SP
 ;CMP BX, DX
 ;JS FIN
 ;JZ FIN
 ADD BX, 4
 MOV CX, WORD PTR [BX] ;EN CX QUEDO NUM2
 
 ADD BX, 2
 MOV DX, WORD PTR [BX] ;EN DX QUEDO NUM1
 
 MOV AX, 0
 LOOP: SUB DX, CX ;DATO 1 -  DATO 2
 JS FIN
 INC AX ; CONTADOR DE CUANTAS VECES RESTA/  ESTE VA A SER ELR RESULT
 JMP LOOP
 

FIN: SUB BX, 4 ;ME MUEVO A RESULT EN LA PILA
MOV [BX], AX
RET


ORG 2000H

 MOV AX, NUM1
 PUSH AX
 MOV AX, NUM2
 PUSH AX
 MOV CX, RESULT
 PUSH CX
 CALL SUBDIV
 POP CX
 MOV RESULT, CX
HLT
END




; OTRA FORMA

;Le resto el num2 a num1 hasta que sea 0 o negativo
;Mientras sea positivo, hago un cointador
ORG 3000H
 DIV: PUSH BX ; preservo los 3 registros
 PUSH AX
 PUSH DX
 
 MOV BX, SP
 ADD BX, 10 ; Voy a la direccion de num2
 MOV AX, [BX] ; Paso el valor 2
 
 ADD BX,2 ;Voy a la direccion de num1
 MOV CX, [BX]; Paso el valor de num1
 
 LOOP: SUB CX,AX ;Resto el num2 al num1 hasta que sea negativo
 JS TERMINO

 INC DX
 JMP LOOP
 
 TERMINO: SUB BX,4 ;Paso el valor a la pila
 MOV [BX], DX
 ;restauro los 3 registros
 POP DX
 POP AX
 POP BX
 
 RET
ORG 1000H
 val1 DB 8H
 val2 DB 2H
 RESULTADO DB ?
  
ORG 2000H
 MOV AL, val1
 MOV AH, 0
 PUSH AX
 MOV AL, val2
 MOV AH, 0
 PUSH AX
 MOV AL, RESULTADO
 MOV AH, 0
 PUSH AX
 CALL DIV
 
 HLT
END

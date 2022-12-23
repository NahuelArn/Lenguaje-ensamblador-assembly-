ORG 1000H
 NUM1 DB 8
 NUM2 DB 5
 RESULT DB ?
 
ORG 3000H
 RESTO: MOV BL, 0 ;RESTO
 MOV BH, 0 ;COCIENTE
 CMP AL, 0 ;COMPARO NUM2 PARA VER SI NO ES 0
 JZ FIN
 CMP AH, 0 ;COMPARO NUM1 PARA VER SI NO ES 0
 JZ FIN
 DIV: SUB AH, AL
  JS RES ;SI ES NEGATIVO, VOY A CALCULAR EL RESTO
  INC DH ; SUMO 1 A MI CONTADOR DE COCIENTE
  JMP DIV
 RES: ADD AH, AL ; SUMO DE VUELTA CH PARA DETERMINAR EL RESTO
  MOV CL, AH ; DEVUELVO EL RESTO EN AL
 FIN: RET
 
 
  ;RECUPERO MIS COSAS DE LA PILA
  
ORG 2000H
 MOV AH, NUM1
 MOV AL, NUM2
 CALL RESTO
 
HLT
END














;OTRO

ORG 1000H
num1 DB 6H
num2 DB 4H
; subrutina resto
; Recibe dos números en los registros CH y CL
; Retorna el resto de la división entera (sin coma) de CH/CL
; Por ejemplo el resto de 6/4 es 2

 ORG 3000H
resto: MOV AL, 0 ; inicializo el resto en 0
 MOV DH, 0 ; inicializo el cociente de la división
 CMP CH, 0 ; CH tiene NUM2
 JZ FIN
 CMP CL, 0 ; CL tiene NUM1
 JZ FIN
DIV: SUB CL, CH
 JS RES ; si resultado negativo, voy a calcular el resto
 INC DH ; sumo al cociente
 JMP DIV
RES: ADD CL, CH ; sumo de vuelta CH para determinar el resto
 MOV AL, CL ; devuelvo el resto en AX
FIN: RET

ORG 2000H
MOV CL, num1
MOV CH, num2
CALL resto
HLT
END
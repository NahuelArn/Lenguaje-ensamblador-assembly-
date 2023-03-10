Escribir un programa que aguarde el ingreso de una clave de cuatro caracteres por teclado sin visualizarla en pantalla. En
caso de coincidir con una clave predefinida (y guardada en memoria) que muestre el mensaje "Acceso permitido", caso
contrario el mensaje "Acceso denegado".

ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN DB ?
CONTRA DB "AB"
CONTRA_PARTE2 DB "CZ"
CANT DB 4H

MENSAJE DB "CORRECTA"
FIN_MENSAJE DB ?
MENSAJE2 DB "INCORRECTA"
FIN_MENSAJE2 DB ?

ORG 3000H
 LEER_CONTRA:MOV BX, SP
 ADD BX,2
 BUCLE: MOV CL,[BX]
 MOV DX, BX
 MOV BX, OFFSET NUM
 INT 6
 MOV AL, 1
 INT 7
 
 CMP CL,NUM
 JNZ INCORRECTO
 
 MOV BX, DX
 INC BX
 DEC CANT
 JNZ BUCLE
 
 CMP CANT,0
 JZ CUMPLE
 
 INCORRECTO: MOV BX, OFFSET MENSAJE2
 MOV AL, OFFSET FIN_MENSAJE2 - OFFSET MENSAJE2
 INT 7 
 JMP TERMINAR
 
 
 CUMPLE:MOV BX, OFFSET MENSAJE
 MOV AL, OFFSET FIN_MENSAJE - OFFSET MENSAJE
 INT 7 
 JMP TERMINAR
 
TERMINAR: RET

ORG 1500H
NUM DB ?

ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
MOV BX, CONTRA_PARTE2
PUSH BX
MOV BX, CONTRA
PUSH BX
CALL LEER_CONTRA

INT 0
END
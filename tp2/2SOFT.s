Escribir un programa que muestre en pantalla todos los caracteres disponibles en el simulador MSX88, comenzando con
el caracter cuyo código es el número 01H.

ORG 1000H
MENSAJE DB 1H
ORG 2000H
MOV BX, OFFSET MESAJE ;DIREC DE MENSAJE
MOV AL, 1 ;CUANTOS CARACTERRES VOY A IMPRIMIR
REPETIR: NOP
INT 7
INC BYTE PTR [BX]
CMP BYTE PTR [BX] ; 7FH si no es 0 lopeo
JNZ REPETIR
INT 0
END 
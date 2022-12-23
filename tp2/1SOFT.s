Escritura de datos en la pantalla de comandos.
Implementar un programa en el lenguaje assembler del simulador MSX88 que muestre en la pantalla de comandos un
mensaje previamente almacenado en memoria de datos, aplicando la interrupción por software INT 7.



ORG 1000H
 MENSAJE DB "ARQUITECTURA DE COMPUTADORAS-"
         DB "FACULTAD DE INFORMATICA-"
         DB 55H ;  U
         DB 4EH ;  N
         DB 4CH ;  L
         DB 50H ;  P
 FIN DB ?
ORG 2000H
 MOV BX, OFFSET MENSAJE
 MOV AL, OFFSET FIN - OFFSET MENSAJE
 INT 7    
 INT 0
END
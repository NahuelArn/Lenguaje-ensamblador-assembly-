Modificar el programa anterior agregando una subrutina llamada ES_NUM que verifique si el caracter ingresado es realmente un número. De no serlo, el programa debe mostrar el mensaje “CARACTER NO VALIDO”. La subrutina debe
recibir el código del caracter por referencia desde el programa principal y debe devolver vía registro el valor 0FFH en caso
de tratarse de un número o el valor 00H en caso contrario. Tener en cuenta que el código del “0” es 30H y el del “9” es
39H.

ORG 1000H
 MENSAJE DB "INGRESE UN NUMERO: "
 FIN DB ?
 MENSAJE2 DB "CARACTER NO VALIDO"
 FIN2 DB ?
 NUEVE DB 39H
 NUM DB ?
 
ORG 3000H
 ES_NUM:INT 6
 CMP NUM,30H
 JS NO_ES
 CMP  NUM,40H 
 JNS NO_ES
 MOV DX,0FFH
 MOV AL, 1
 INT 7
 JMP TERMINO
 NO_ES: MOV DX, 00H
 MOV BX, OFFSET MENSAJE2
 MOV AL, OFFSET FIN2-OFFSET MENSAJE2
 INT 7
 
TERMINO: RET

ORG 2000H 
 MOV BX, OFFSET MENSAJE
 MOV AL, OFFSET FIN-OFFSET MENSAJE
 INT 7
 
 MOV BX, OFFSET NUM
 CALL ES_NUM
 
 MOV CL, NUM 
 INT 0

END
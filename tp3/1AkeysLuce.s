Escribir un programa que verifique si la llave de más a la izquierda está prendida. Si es así, mostrar en
pantalla el mensaje “Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo importa el valor
de la llave de más a la izquierda (bit más significativo). Recordar que las llaves se manejan con las
teclas 0-7.

ORG 1000H; Memoria de datos
 MENSAJE db "Llave prendida"
 MENSAJE2 db "Llave apagada"
 FIN db ?
 CA EQU 32h
 PA EQU 30h

; CONFIGURAR PA (ENTRADA) Y PB (SALIDA)
ORG 2000H;Prog principal
 MOV AL, 0ffh ;1111 1111
 OUT CA, AL                         ;1 PARA ENTRADA Y 0 PARA SALIDA 
 ;EN EL OUT RECIEN PUEDO TOCAR LAS LLAVES PARA QUE ME EL RESULTADO CORRECTO 
 ;LEEMOS EL ESTADO DE LAS LLAVESS
 IN AL, PA
 
 ; poner en 0 todos los bits menos el más significativo 
 AND AL, 10000001B;
 ; si es 0
 CMP AL, 0
 JZ APAGADA
 ; esta prendida
 mov BX, OFFSET MENSAJE
 mov AL, OFFSET MENSAJE2 - OFFSET MENSAJE
 JMP FIN2
 
 APAGADA: MOV BX, OFFSET MENSAJE2
 mov AL,OFFSET FIN - OFFSET MENSAJE2
 FIN2: int 7 ; imprimir
 HLT
 
 
 
 ORG 1000H; Memoria de datos
prendida db "Llave prendida"
apagada db "Llave apagada"
fin_apagada db ?
PA EQU 30h
CA EQU 32h
ORG 2000H;Prog principal
mov al, 0ffh
out CA,al
in al,PA
; poner en 0 todos los bits menos el más sig
and al,80h;1000 0000
; si es 0
cmp al,0
jz esta_apagada
; esta prendida
mov bx, offset prendida
mov al,OFFSET apagada - OFFSET prendida
jmp fin
esta_apagada: mov bx, offset apagada
mov al,OFFSET fin_apagada - OFFSET apagada
fin: int 7 ; imprimir
HLT
END

;CA Y CB SON LAS PRE CONFIGURACIONES
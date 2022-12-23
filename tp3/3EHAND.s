dem d), pero ahora utilizar el HAND-SHAKE en modo interrupciones.

;3E POR INTERRUPCION HANDSHAKE FUNCIONANDO CORRECTAMENTE
;HAND-SHAKE
HAND_DATO EQU 40H
HAND_ESTADO EQU 41H
;PIC
EOI EQU 20H
IMR EQU 21H
HANDSHAKE EQU 26H

ORG 1000H
STRING DB "00000" ;0,0,0,0,0
SALTO DB 0AH
FLAG DB 0

;STRING DB ?;
ORG 40
PUNTERO DW 3000H
ORG 3000H

CMP FLAG, 1
JZ INVERSO
;LE MANDO EL CARACTER / NORMAL
MOV AL, [BX]
OUT HAND_DATO, AL
INC BX
;DEC DL
CMP BX, OFFSET SALTO
JNZ CASI_FIN
INC FLAG
JMP CASI_FIN

;LE MANDO EL CARACTER / INVERSO

INVERSO: NOP
MOV AL, [BX]
OUT HAND_DATO, AL
DEC BX
DEC DH           ;INVERSO
JNZ CASI_FIN

;AVISO QUE YA TERMINE
MOV AL, EOI
OUT EOI, AL

;DESACTIVO EL HANDSHAKE PARA QUE NO ME JODA
IN AL, HAND_ESTADO
AND AL, 07FH ;011111111
OUT HAND_ESTADO, AL ;ESTADO = 0XXXXXXX

IRET

;AVISO QUE YA CASI TERMINE
CASI_FIN: MOV AL, EOI
OUT EOI, AL
IRET


ORG 2000H

;PEDIR CARACTERES
MOV DL, 5
MOV BX, OFFSET STRING
LOPARDO: CMP DL, 0
JZ FIN_PEDIDO
INT 6
INC BX
DEC DL
JMP LOPARDO
FIN_PEDIDO: NOP

CLI
MOV AL, 0FBH ;11111011B AVISO AL IMR QUE TIPO DE INTERRUPCION ES, EN ESTE CASO ES EL HANDSHAKE
OUT IMR, AL

MOV AL, 10          ;ID
OUT HANDSHAKE, AL   ;10X4=40

;CONFIGURAR EL HAND-SHAKE PARA INTERRUPCION
IN AL, HAND_ESTADO
OR AL, 80H ;10000000B
OUT HAND_ESTADO, AL ;1XXXXXXX

MOV DL, 6
MOV DH, 6
MOV BX, OFFSET STRING
STI

;ESTA ES LA VENTAJA DEL HANDSHAKE POR INTERRUPCION NO TIENE QUE ESTAR PENDIENTE 
;SI LA IMPRESORA ESTA LIBRE PUEDE HACER OTRAS COSAS EN LA PC
LAZO: NOP
 NOP ; Esto es el Counter
 NOP ; Esto es Youtube
 NOP ; Esto es el Chrome
JMP LAZO

INT 0
END
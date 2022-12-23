Escribir un programa que solicita el ingreso de cinco caracteres por teclado y los envía de a uno por
vez a la impresora a través de la PIO a medida que se van ingresando. No es necesario mostrar los
caracteres en la pantalla.

;CONFIG PIO
PA EQU 30H
PB EQU 31H
;PARTE DE DATOS DEL PIO
CA EQU 32H
CB EQU 33H

ORG 3000H
INI_IMPRESORA_PIO: NOP
MOV AL, 11111101B ;STROBE EN 0 (SALIDA) Y BUSY EN 1(ENTRADA)
OUT CA, AL

MOV AL, 0 ;TODOS DE SALIDA
OUT CB, AL
RET

PEDIR_CARAC: NOP         ;PARA PEDIR UN CARAC NECESITO LA DIRECCION DONDE SE VA GUARDAR EN BX Y EN AL LA CANTIDAD
PUSH BX                  
MOV BX, OFFSET CARACTER  ;
MOV AL, 1
INT 6
POP BX
RET

FLIP_FLOP: NOP  ;PULSO DE STROBE (INICIALIZAR EN 0) Y CUANDO RECIBE UNA LETRA QUE LO ESPERE EN 1 Y DESPUES ABAJO 
PUSH AX

;STROBE EN 0
;LO DEJO ABAJO OTRA VEZ ; ESO SERIA UNA ESPECIE DE SOLO ACTIVACION POR FLANCO ASCENDENTE

IN AL, PA ; ME TRAIGO LA INFO ACTUAL 
AND AL, 0FDH ;11111101B  ;FUERZO EL STROBE EN 0
OUT PA, AL


;STROBE EN 1
IN AL, PA ;PIDO EL DATO ACTUAL 
OR AL, 2 ; FUERZO STROBE EN 1 ;00000010B
OUT PA, AL

;STROBE EN 0
;LO DEJO ABAJO OTRA VEZ ; ESO SERIA UNA ESPECIE DE SOLO ACTIVACION POR FLANCO ASCENDENTE

IN AL, PA ; ME TRAIGO LA INFO ACTUAL 
AND AL, 0FDH ;11111101B  ;FUERZO EL STROBE EN 0
OUT PA, AL
POP AX
RET

POL: NOP   ;ENCARGADO DE VERIFICAR Q LA IMPRESORA NO ESTE OCUPADA (POLLING)
PUSH AX
IN AL, PA  ;ME TRAIGO EL ESTADO ACTUAL DE PA A AL
AND AL, 1  ; LE HAGO UN AND PARA VER SI SIGUE OCUPADO
JNZ POL    ;MIENTRAS NO ESTE LIBRE, SIGO CONSULTADO
POP AX
RET

PONER_CARACTER_A_IMPRESORA: NOP
PUSH AX
PUSH BX
MOV BX, OFFSET CARACTER
MOV AL, [BX]
OUT PB, AL
POP BX
POP AX
RET 

ORG 1000H
CARACTER DB ?

ORG 2000H
CALL INI_IMPRESORA_PIO
MOV DL, 5

FOR: NOP  ;FOR DE 5 DESPUES CORTA

CALL POL

CALL PEDIR_CARAC
CALL PONER_CARACTER_A_IMPRESORA

CALL FLIP_FLOP                

DEC DL
CMP DL, 0
JZ TERMINO
JMP FOR

TERMINO: INT 0
END

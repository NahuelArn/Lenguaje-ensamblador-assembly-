Uso de la impresora a través de la PIO. Ejecutar los programas en la configuración P1 C1 del simulador.
En esta configuración, el puerto de datos de la impresora se conecta al puerto PB del PIO, y los bits de busy
y strobe de la misma se conectan a los bits 0 y 1 respectivamente del puerto PA. Presionar F5 para mostrar la
salida en papel. El papel se puede blanquear ingresando el comando BI.

a) * Escribir un programa para imprimir la letra “A” utilizando la impresora a través de la PIO.

;PIC
EOI EQU 20H
IMR EQU 21H
F10_INT EQU 24H

TIMER_INT EQU 25H
;CONFIG TIMER
CONT EQU 10H
COMP EQU 11H
;PIO
PA EQU 30H
PB EQU 31H

CA EQU 32H
CB EQU 33H

ORG 1000H
CARACTER DB "A"

ORG 3000H



ORG 2000H
;CONFIG PIO

;INICIALIZO STROBE EN 0
MOV AL, 11111101B ; CONFIG STROBE EN 0 SALIDA, Y BUSY DE ENTRADA 1
OUT CA, AL ;CARGAMOS MI STROBE QUE ES 
;PUERTO DE DATOS
MOV AL, 0 ; TODOS DE SALIDA
OUT CB, AL

;MANDO STROBE EN 0
IN AL, PA
AND AL, 11111101B
OUT PA, AL

;ACA HAGO LLAMO A POL/ CONTROL DE ESTADO, ME FIJO QUE LA IMPRESORA NO ESTE OCUPADA
POLL: NOP
IN AL, PA
AND AL, 1 ;
JNZ POLL
;CUANDO SALE MANDO EL CARACTER
;MANDO CARACTER
MOV BX, OFFSET CARACTER
MOV AL, [BX]
OUT PB, AL

;MANDO EL PULSO DE STROBE EN 1, QUE 
IN AL, PA
OR AL, 2
OUT PA, AL

LAZO: JMP LAZO

INT 0
END







;Ejecutar en configuración 1
ORG 1000H; Memoria de datos
CARACTER db "A"
PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 2000H;Prog principal
MOV AL, 01h     ; strobe salida (0), busy entrada (1), resto en 0
OUT CA, AL
MOV AL, 0       ;PUERTO DE DATOS, TODO SALIDA
OUT CB, AL      

; INICIALIZO STROBE EN 0
IN AL, PA
AND AL, 0FDh    ; 1111 1101b
OUT PA, AL

; ESPERO QUE BUSY  = 0
POLL: IN AL, PA
AND AL,01h      ;0000 0001b
JNZ POLL

; se que busy es 0, mandar carácter
MOV AL, CARACTER
OUT PB, AL

;MANDAR FLANCO ASCENDENTE DE STROBE
IN AL, PA
OR AL, 02h     ; 00000010b
OUT PA, AL
INT 0
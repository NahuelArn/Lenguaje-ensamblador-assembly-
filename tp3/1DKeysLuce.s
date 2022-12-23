Escribir un programa que implemente un encendido y apagado sincronizado de las luces. Un contador,
que inicializa en cero, se incrementa en uno una vez por segundo. Por cada incremento, se muestra a
través de las luces, prendiendo solo aquellas luces donde el valor de las llaves es 1. Entonces, primero
se enciende solo la luz de más a la derecha, correspondiente al patrón 00000001. Luego se continúa con
los patrones 00000010, 00000011, y así sucesivamente. El programa termina al llegar al patrón
11111111.

; PIO
PA EQU 30H ;LLAVES CONFIG
PB EQU 31H ;LUCES CONFIG

CA EQU 32H ;LLAVES PRE CONFIG
CB EQU 33H ;LUCES PRE CONFIG

;TIMER
CONT EQU 10H ;CONTADOR DEL TIMER
COMP EQU 11H ;COMPRADORAR DEL TIMER/ HASTA DONDE VA A A CONTAR
;PIC
EOI EQU 20H  ;EL Q AVISA CUANDO COMIENZA Y FINALIZA UN PROGRAMA
IMR EQU 21H  ; QUE INTERRUPCION VOY A ATENDER 
INT1 EQU 25H ;INTERRUPCION TIMER

ORG 1000H
BINARIO DB 0
FLAG_FIN DB 0

ORG 40
SALTO_SUBRUTINA DW 3000H
ORG 3000H
PUSH AX
INC BINARIO
CMP BINARIO, 0FFH
JNZ LUCES
MOV FLAG_FIN, 1

MOV AL, EOI ;AVISO Q MI INTERRUPCION TERMINO
OUT EOI, AL
JMP CORTE

LUCES: NOP
MOV AL, BINARIO
OUT PB, AL
;PONGO EN 0 DENUEVO MI TIMER
MOV AL, 0
OUT CONT, AL

CORTE: NOP
MOV AL, EOI ;AVISO Q MI INTERRUPCION TERMINO
OUT EOI, AL
POP AX
IRET

ORG 2000H
; PRE CONFIG LLAVES
MOV AL, 0FFH
OUT CA, AL
; PRE CONFIG LUCES
MOV AL, 0
OUT CB, AL

CLI
MOV AL, 0FDH ;1111 1101B ;AVISO DE QUE TIPO ES LA INTRRUPCION
OUT IMR, AL

MOV AL, 10   ;10X4= 40
OUT INT1, AL

;COSAS DEL TIMER
MOV AL, 3
OUT COMP, AL

MOV AL, 0
OUT CONT, AL

STI
LAZO: CMP FLAG_FIN, 1
JZ TERMINE
JMP LAZO

TERMINE: INT 0
END
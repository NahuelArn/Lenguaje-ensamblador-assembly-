Escribir un programa que implemente un conteo regresivo a partir de un valor ingresado desde el teclado. El conteo
debe comenzar al presionarse la tecla F10. El tiempo transcurrido debe mostrarse en pantalla, actualizándose el valor cada
segundo.


TIMER EQU 10H
PIC EQU 20H
IMR EQU 21H
F10 EQU 24H
EOI EQU 20H
TIMER 25H
N_CLK EQU 10
N_F10 EQU 11

ORG 40
IP_CLK DW RUT_CLK
ORG 44
IP_F10 DW RUT_F10

ORG 1000H
TEX DB "Ingresar en segundos inicio de Cuenta Atras: "
FIN DB ?
SEG DB ?
SEG2 DB ?
FIN2 DB ?

ORG 3000H
RUT_CLK: PUSH AX
DEC SEG2
CMP SEG2, 2FH
JNZ RESET
MOV SEG2, 39H
DEC SEG
CMP SEG, 2FH
JNZ RESET
CMP SEG2, 39H
JNZ RESET
DEC DH
MOV AL, 0FFH
OUT PIC+1, AL
RESET: INT 7
MOV AL, 0
OUT TIMER, AL
MOV AL, EOI
OUT PIC, AL
POP AX
IRET
RUT_F10: PUSH AX
DEC DH
MOV AL, EOI
OUT PIC, AL
POP AX
IRET

ORG 2000H
MOV BX, OFFSET TEX
MOV AL, OFFSET FIN - OFFSET TEX
INT 7
MOV BX, OFFSET SEG
INT 6
MOV BX, OFFSET SEG2
INT 6

CLI
MOV AL, 0FEH  ;IMR AVISI Q TIPO DE INTERRUPCION VOY A USAR 1111 1110
OUT IMR, AL
MOV AL, N_F10  ;F10
OUT F10, AL
MOV DH, 1
STI

CLI
LOOP: CMP DH, 0
JNZ LOOP
STI

CLI
MOV AL, 0FDH
OUT IMR, AL ; PIC: registro IMR
MOV AL, N_CLK
OUT TIMER, AL ; PIC: registro INT1
MOV AL, 1
OUT IMR, AL ; TIMER: registro COMP
MOV AL, 0
OUT TIMER, AL ; TIMER: registro CONT
MOV BX, OFFSET SEG
MOV AL, OFFSET FIN2 - OFFSET SEG
MOV DH, 1
STI

LAZO: CMP DH, 0
JNZ LAZO
END

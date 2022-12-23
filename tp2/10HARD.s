Interrupción por hardware: tecla F10.
Escribir un programa que, mientras ejecuta un lazo infinito, cuente el número de veces que se presiona la tecla F10 y
acumule este valor en el registro DX.

PIC EQU 20H
EOI EQU 20H
IMR EQU 21H
F10 EQU 24H
N_F10 EQU 10
ORG 40
PUNTERO DW 3000H
ORG 3000H
RUT_F10: PUSH AX
INC DX
MOV AL, EOI
OUT EOI, AL ; PIC: registro EOI
POP AX
IRET

ORG 2000H

CLI
MOV AL, 0FEH
OUT IMR, AL ; PIC: registro IMR
MOV AL, N_F10
OUT F10, AL ; PIC: registro INT0
MOV DX, 0
STI
LAZO: JMP LAZO

END
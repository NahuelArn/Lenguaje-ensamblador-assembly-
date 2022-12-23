; Recibe el caracter a rotar en AH
; Devuelve el resultado también en AH

ORG 1000H
 BINARIO DB 80h ; (10000000) en binario
ORG 3000H
 ROTARIZQ: ADD AH, AH
  ADC AH, 0 ;Suma el carry
  INC DL ;CONTADOR PARA  CONTROLAR QUE PASABA
  RET

ORG 3500H
 ROTARIZQ_N: CMP BH, 0 ; mientras BH>0 AND BH<= 6
 JZ FIN ; si BH=0, entonces finalizar la subrut.
 CALL ROTARIZQ
 DEC BH ;veces que se va a repetir DECREMENTO LAS VECES Q VA A LOPEEAR
 JMP ROTARIZQ_N ; aprovecho la etiqueta de la subrutina
; para hacer el salto
FIN: RET


ORG 3800H
ROTARDER_N: MOV CH, 8
 SUB CH, BH ; cantidad de bytes que debo rotar hacia la izq. (8-N)  (8-2)
 MOV BH, CH ; vuelvo a copiar en BH (8-N) (GUARDO 6) (EL 6 ESTE VA A SER LAS VECES Q VA A LOOPEAR)
 ; ROTARIZQ usará el valor almacenado en BH para rotar.
 CALL ROTARIZQ_N
 RET

ORG 2000H
 MOV AH, BINARIO ; AH = 10000000
 ; Realizamos una rotación
 MOV BH,2 ;veces a repetir
 CALL ROTARDER_N ; AH = 00100000
 
HLT
END
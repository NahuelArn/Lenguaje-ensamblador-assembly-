ORG 1000H
 CARACTER DB "A"
 ESVOC DW 0FFh
 NOES DW 00h
 RESULT DW ?
 
ORG 3000H
 ES_VOCAL: MOV AL, ESVOC ;Si es
 CMP AH, 41h ; A
 JZ FIN
 CMP AH, 45h ; E
 JZ FIN
 CMP AH, 49H ; I
 JZ FIN
 CMP AH, 4FH ; O
 JZ FIN
 CMP AH, 55H ; U
 JZ FIN
 CMP AH, 61h ; a
 JZ FIN
 CMP AH, 65h ; e
 JZ FIN
 CMP AH, 69H ; i
 JZ FIN
 CMP AH, 6FH  ; o
 JZ FIN
 CMP AH, 75H ; u
 JZ FIN
 MOV AL, NOES ; NO ES ;; si recorro todo y no para en ninguna llega aca y noes
 FIN: RET 

ORG 2000h
 MOV AH, CARACTER ;1000h
 CALL ES_VOCAL
 MOV RESULT, AL
 HLT
END
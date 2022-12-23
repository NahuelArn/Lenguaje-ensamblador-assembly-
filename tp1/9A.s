; Recibe el caracter a rotar en AH
 ; Devuelve el resultado también en AH

ORG 1000H
b DB 27H ; (00100111) en binario

ORG 3000H
ROTARIZQ: ADD AH, AH
 ADC AH, 0
 RET

ORG 2000H
MOV AH, b ; AH = 00100111
; Realizamos una rotación
CALL ROTARIZQ ; AH = 01001110
; Realizamos una segunda rotación
CALL ROTARIZQ ; AH = 10011100
HLT
 END
 
 
 
 
;---------------------------------------------------


ORG 1000H
 BINARIO DB 10010100B ;B LE DIGO QUE ES UN BINARIO

ORG 3000H
 ROTARIZQ: ADD AH, AH ;SUMO POR EL MISMO NUMERO PARA DARLO VUELTA
  ADC AH, 0  ;ADC SUMA EL EL 1 DE CARRY A LA CUENTA
  RET

ORG 2000H
 MOV AH, BINARIO
 
 CALL ROTARIZQ
 
 CALL ROTARIZQ  ; PREGUNTAR BIEN PARA Q ESTA ESTE
 
 HLT
 END
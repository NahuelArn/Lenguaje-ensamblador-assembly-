ORG 1000H
 CADENA DB "5ODE55TA" ;CADENA GODETA
 TECAES DB 0 ;FIN DE MI TABLA
 CARAC1 DB "5" ;ORIGINAL
 CARAC2 DB "2" ;REEMPLAZO
 RES DW ?

ORG 3000H
 INCREMENTAR: INC BX
 JMP LOOP
 
 CAMBIAZO: MOV [BX], CH
 INC DL ;CONTADOR DE CUANTAS VECES HICE UN REEMPLAZO
 JMP INCREMENTAR
 
 REEMPLAZAR_CAR: MOV BX, SP ;BP
  ADD BX, 2
  MOV DH, BYTE PTR [BX] ;DH FIN TABLA
  ADD BX, 2
  MOV CL, BYTE PTR [BX] ; ORIGINAL
  INC BX 
  MOV CH, BYTE PTR [BX] ; REEMPLAZO
  INC BX

  MOV BX, WORD PTR [BX] ;CADENA
  ;CMP BX, TECAES
  LOOP: CMP [BX], DH
  JZ TERMINE
  
  CMP [BX], CL
  JZ CAMBIAZO
  JMP INCREMENTAR ;PASO AL SIGUIENTE
 TERMINE: RET
 
ORG 2000H
 
 MOV AX, OFFSET CADENA ;CADENA GODETA
 ;MOV AH, TECAES ;ME CAIGO?   ; AX ESTA RE ALPEDO
 PUSH AX
 MOV CL, CARAC1 ;VIEJO CARACTER
 MOV CH, CARAC2 ;NUEVO CARACTER
 PUSH CX
 MOV DX, 0  ; DL CONTADOR DE CUANTAS VECES HICE UN REEMPLAZO
 PUSH DX    ; DH FIN TABLA
 CALL REEMPLAZAR_CAR ;LLAMO A LA SUBRUTINA
 MOV RES, DL ; CUANTAS VECES HICE UN CAMBIO
HLT
END













;--------------------------------------------------------------
ORG 1000H
 CADENA DB "GODETA" ;CADENA GODETA
 TECAES DB 0 ;FIN DE MI TABLA
 CARAC1 DB 5H ;ORIGINAL
 CARAC2 DB 2H ;REEMPLAZO
 RES DW ?

ORG 3000H
 INCREMENTAR: INC BX
 JMP LOOP
 
 CAMBIAZO: MOV CL, CH
 INC DL ;CONTADOR DE CUANTAS VECES HICE UN REEMPLAZO
 JMP INCREMENTAR
 ;INC BX
 ;JMP LOOP
 
 REEMPLAZAR_CAR: MOV BX, SP ;BP
  SUB BX, 3 
  MOV DH, BYTE PTR [BX] ;DH FIN TABLA
  SUB BX, 3
  MOV CL, BYTE PTR [BX] ; ORIGINAL
  INC BX 
  MOV CH, BYTE PTR [BX] ; REEMPLAZO
  INC BX
  LOOP: MOV BX, WORD PTR [BX] ;CADENA
  CMP BX, TECAES
  JZ TERMINE
  
  CMP [BX], CL
  JZ CAMBIAZO
  JMP INCREMENTAR ;PASO AL SIGUIENTE
 TERMINE: RET
ORG 2000H
 
 MOV AL, CADENA ;CADENA GODETA
 MOV AH, TECAES ;ME CAIGO?
 PUSH AX
 MOV CL, CARAC1 ;VIEJO CARACTER
 MOV CH, CARAC2 ;NUEVO CARACTER
 PUSH CX
 MOV DX, 0  ; DL CONTADOR DE CUANTAS VECES HICE UN REEMPLAZO
 PUSH DX    ; DH FIN TABLA
 CALL REEMPLAZAR_CAR ;LLAMO A LA SUBRUTINA
HLT
END
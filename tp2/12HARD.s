Interrupción por hardware: TIMER.
Implementar a través de un programa un reloj segundero que muestre en pantalla los segundos transcurridos (00-59 seg)
desde el inicio de la ejecución

;ANDANDO

ORG 1000H
 SEG DB 30H
     DB 30H
 FIN DB ?
 
ORG 3000H
 RUT_CLK: PUSH AX
 
 ;VAMOS SUMANDO DEL 00 AL 09
 MOV BX, OFFSET SEG
 INC BX
 INC BYTE PTR [BX]
 CMP BYTE PTR [BX], 3AH
 JNZ RESET
 
 ;VAMOS SUMANDO DEL 00 AL 60 (En la direccion que le sigue a segundo)
 ;COMIENZO EN EL SEGUNDO DIGITO
 MOV BYTE PTR [BX], 30H ;iniciamos en 0
 DEC BX ;SEG
 INC BYTE PTR [BX]
 CMP BYTE PTR [BX], 36H ;Hasta el 60
 JNZ RESET
 
 MOV BYTE PTR [BX], 30H
 
 RESET: MOV BX, OFFSET SEG ;REINICIAMOS EL ESTADO DE SEGUNDOS
 MOV AL, OFFSET FIN-OFFSET SEG ;PORQUE LO USAMOS MAS ARRIBA
 INT 7
 MOV AL, 0
 OUT 10H, AL
 MOV AL, 20H
 OUT 20H, AL
 POP AX
IRET
 
ORG 2000H
 ;ID 10 PARA EL TIMER
 ;CONFIGURAMOS EL VECTOR DE INTERRUPCIONES
 MOV AX, RUT_CLK
 MOV BX, 40
 MOV [BX], AX
 ;CONFIGURAMOS EL PIC
 CLI
 MOV AL, 11111101b ;Activamos el timer
 OUT 21H, AL ; PIC: registro IMR
 
 MOV AL, 10
 OUT 25H, AL ; PIC: registro INT1 (Timer)
 MOV AL, 1
 OUT 11H, AL ; TIMER: registro COMP (No se cual es)
 MOV AL, 0
 OUT 10H, AL ; TIMER: registro CONT
 
 
 STI
 LAZO: JMP LAZO ;EN 14 SALE POR Q?   CUANDO SALE VA A LA DIRECICON 3000H PORQ LO CONFIGURE ASI EN LA INTERRUPCION
END
.data
car: .ascii "O"
cad: .asciiz "AEIOUaeiou"
res: .word 0

.code
lbu $a0, car($0)
jal es_vocal
sd $v0, res($0)
halt


es_vocal: dadd $v0, $0, $0	; inicio valor de retorno
daddi $t0, $0, 0			; inicio desplazamiento

loop: lbu $t1, cad($t0)		; $t1 = elem. de cad
beqz $t1, fin				; si $t1 = 0 salto
beq $a0, $t1, vocal			; si $t1 = $a0 salto
daddi $t0, $t0, 1			; aumento el desplazamiento
j loop							
vocal: daddi $v0, $0, 1		; si es vocal retorno 1

fin: jr $ra

--------------------------------------------------------------

.data
    LETRA: .ascii '1'
    VOCALES: .asciiz 'AEIOUaeiou'
    RESULTADO: .word 0
.code
    lbu $a0, LETRA($0)          ; paso el CARACTER
    jal ES_VOCAL                ; llamo a la subrutina
    sd $v0, RESULTADO($zero)    ; guardo el resultado
halt

ES_VOCAL:   dadd $v0, $0, $0                ; inicializo v0
            daddi $t0, $0, 0                ; inicializo t0
            LOOP: lbu $t1, VOCALES($t0)     ; copia el  caracter en t1
                beqz $t1, FIN_VOCAL         ; si t1 = 0, no se encontro VOCALES
                beq $a0, $t1, ENCONTRO      ; si LETRA = caracterActual, salto
                daddi $t0, $t0, 1           ; continuo con el siguiente caracter
            j LOOP

            ENCONTRO: daddi $v0, $0, 1      ; si es vocal, retorno 1
            
            FIN_VOCAL: jr $ra               ;vuelvo al programa principal























.data
    CADENA: .asciiz "CazaAAA"
    VOCALES: .asciiz 'AEIOUaeiou'
    CANT: .word 0
.code
    ; La pila comienza en el tope de la memoria de datos
    DADDI $sp, $0, 0x400            ; bus 10 bits 🡪 2^10 = 1024 = 0x400

    ; Guarda como primer argumento para CONT_VOCALES
    ; la dirección de CADENA

    DADDI $a0, $0, CADENA
    dadd $v0, $0, $0  
    JAL CONT_VOCALES
    sd $v0, CANT($0)                  ; Cantidad de caracteres
HALT

CONT_VOCALES: DADDI $sp, $sp, -16     ; Reserva lugar en pila -> 2 x 8
    SD $ra, 0 ($sp)                   ; Guarda en pila $ra
    SD $s0, 8 ($sp)                   ; Guarda en pila $s0

    DADD $s0, $a0, $0                 ; Copia la dirección de inicio de la CADENA
    LOOP: LBU $a0, 0 ($s0)	        ; Toma car. actual
        BEQ $a0, $zero, FIN         ; Si es el fin, termina
        JAL ES_VOCAL
        DADDI $s0, $s0, 1           ; Avanza al siguiente caracter
    J LOOP

    ; Recupera los datos salvados en la pila
    FIN: LD $ra, 0 ($sp)
        LD $s0, 8 ($sp)
        DADDI $sp, $sp, 16
    JR $ra




ES_VOCAL: daddi $t0, $0, 0                    ; inicializo t0
    LOOP2: lbu $t1, VOCALES($t0)     ; copia el  caracter en t1
        beqz $t1, FINVOCAL         ; si t1 = 0, no se encontro VOCALES
        beq $a0, $t1, ENCONTRO      ; si LETRA = caracterActual, salto
        daddi $t0, $t0, 1           ; continuo con el siguiente caracter
    j LOOP2

    ENCONTRO: daddi $v0, $v0, 1      ; si es vocal, aumento 1 el contador
    FINVOCAL: jr $ra               ;vuelvo al programa principal  






-------------------------------------------------------



.data

cadena: .asciiz "apAEIrtvb:ruebAeuioEIUtryvfg"			; 14 vocales
vocales: .asciiz "AEIOUaeiou"
res: .word 0

.code

daddi $sp, $0, 0x400			; inicio la pila
daddi $a1, $0, cadena			; $a1 = puntero a cadena
jal contar_voc
sd $v1, res($0)
halt


contar_voc: daddi $sp, $sp, -8		; "push" guardo primera direccion de retorno
sd $ra, 0($sp) 

daddi $v1, $0, 0					; inicio valor de retorno
daddi $t2, $0, 0					; inicio desplazamiento

loop2: lbu $a0, cadena($t2)
beqz $a0, fin2						; si $a0 = 0 salto (termino la cadena)
jal es_vocal
beqz $v0, no_es						; si $v0 = 0 salto
daddi $v1, $v1, 1					; si es vocal aumento en 1 el retorno
no_es: daddi $t2, $t2, 1			; aumento el desplazamiento
j loop2

fin2: ld $ra, 0($sp)
daddi $sp, $sp, 8					; "pop" tomo nuevamente direccion de retorno original

jr $ra


es_vocal: dadd $v0, $0, $0			; inicio valor de retorno
daddi $t0, $0, 0					; inicio desplazamiento

loop: lbu $t1, vocales($t0)			; $t1 = elem. de cad
beqz $t1, fin						; si $t1 = 0 salto
beq $a0, $t1, vocal					; si $t1 = $a0 salto
daddi $t0, $t0, 1					; aumento el desplazamiento
j loop							
vocal: daddi $v0, $0, 1				; si es vocal retorno 1

fin: jr $ra
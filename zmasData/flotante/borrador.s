.data 
TABLA: .word 3,6,2,5,1
CONTROL: .word32 0x10000
DATA: .word32 0x10008
AZUL: .byte 0, 0, 255, 0
COORDX: .byte 0
COORDY: .byte 49

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)
daddi $s5, $0, 5  ;cod para pintar un pixel
daddi $a0, $0, 5 ; a0 = longitud de la tabla
daddi $a1,$0, TABLA ;a1 = dir de la tabla
lwu $t0, AZUL($0) 
sw $t0, 0($s1) 
jal recorrer
halt

recorrer: 
    dadd $t1, $0, $a0 ; t1= 5 
    dadd $t2, $0, $a1 ; dir de la tabla
    lbu $t4, COORDY($0)
loop1: 
    ld $t3, 0($t2) # t3 =  5, 6, 2 , 5, 1
    lbu $t5, COORDX($0)   #t5 = t5 = 0 
pintar_pixel: 
    sb $t5, 5($s1)    #t5 = X guardala en pos 5
    sb $t4, 4($s1)    #t4 = Y 49, 48, 47, 46, 45
    sb $s5, 0($s0)    # le mando el cod para que pinte el pixel 
    daddi $t5,$t5,1   #t5 =  1, 2, 3 / 1, 2, 3, 4, 5, 6 / 
    bne $t5, $t3, pintar_pixel #if t5 <> t3 salta pintar
    daddi $t4,$t4,-1  # el que decrementa las filas
    daddi $t1,$t1, -1 # la cantidad de veces que va a pasar esto
    daddi $t2, $t2, 8 # salto el siguiente el tabla
    bnez $t1, loop1 #if no es 0, vuelvo a loop1
fin: jr $ra    

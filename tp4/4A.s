.data 
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11 
num: .word 7
long: .word 10 
 .code 
 ld r1, long(r0) 
 ld r2, num(r0) 
 dadd r3, r0, r0 
 dadd r10, r0, r0 
loop: ld r4, tabla(r3) 
 beq r4, r2, listo 
 daddi r1, r1, -1 
 daddi r3, r3, 8 
 bnez r1, loop 
 j fin 
listo: daddi r10, r0, 1 
fin: halt


COMENTADO


#este programa recorre las 10 posiciones del vector, buscando el numero 7, si lo encuentra termina el programa
#si pasan las 10 veces y no encuentra el numero 7, termina el programa

.data 
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11 
num: .word 7
long: .word 10 
 .code 
 ld r1, long(r0)  #cargo el 10 en el registro r1
 ld r2, num(r0)   #cargo el 7 en el registro r2
 dadd r3, r0, r0  #inicializo el registro r3 en 0
 dadd r10, r0, r0  #inicializo el registro r10 en 0
loop: ld r4, tabla(r3)  #cargo el primer numero de la tabla en el registro r4
 beq r4, r2, listo   #si r4 es igual a r2 salta a la direccion listo
 daddi r1, r1, -1  #decremento en 1 la longitud
 daddi r3, r3, 8   #paso al siguiente en la tabla
 bnez r1, loop   #si r1 es distinto de 0 salta a la direccion loop
 j fin  #salto incondicional a la direccion fin
listo: daddi r10, r0, 1  #coNtador de veces que se encontro el 7 en la tabla
fin: halt
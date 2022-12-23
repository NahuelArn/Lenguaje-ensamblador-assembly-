.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.code
ld r1, car(r0)  ;Caracter a comparar
dadd r2, r0, r0 ;Contador
dadd r3, r0, r0 ;Desplazamiento
loop: lbu r4, cadena(r3) ;Ponemos en r4 el caracter
daddi r3, r3, 1         ;Le sumamos +1 a r3 así avanzamos por sus caracteres
beqz r4, fin            ;Si r4 es 0 terminamos (ya que al final de la cadena hay un 0)
beq r1, r4, es_d        ;Si el caracter es igual a la cadena entonces saltamos a contarlo
j loop                  ;Sino reinciamos el loop
es_d: daddi r2, r2, 1   ;Sumamos 1 al contador
j loop                  ;Reinciamos el loop
fin: sd r2, cant(r0)    ;Llega al final y almacena
halt 
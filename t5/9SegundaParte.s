Escriba la subrutina ES_VOCAL que determina si un caracter es vocal o no, ya sea mayúscula o minúscula. La
rutina debe recibir el caracter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario.

#mayusculas y minusculas rango de letras
#41H-5AH / 61H-7AH no lo use en este
.data
vocal: .asciiz "AEIOUaeiou" 
caracter: .asciiz "Z"	
Es: .word 0 #1 si es vocal, 0 si no lo es

.code
daddi $a1, $zero, vocal
lbu $a0, caracter($zero) #carga el caracter en $a0

jal es_vocal #llama a la funcion es_vocal
sd $v0, Es($zero) #guarda el resultado en la variable Es
halt 

es_vocal: dadd $v0, $zero, $zero #inicializa el resultado en 0
lopardo: lbu $t0, 0($a1) #carga el primer caracter de la cadena vocal
beqz $t0, fin #me quede sin vocales a comparar, salgo
beq $a0, $t0, es #comparo el caracter con la vocal
daddi $a1, $a1, 1 #paso a la siguiente vocal
j lopardo #vuelvo a comparar

es: daddi $v0, $v0, 1 #si es vocal, incremento el resultado
fin: jr $ra
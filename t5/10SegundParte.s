Usando la subrutina escrita en el ejercicio anterior, escriir la subrutina CONTAR_VOC, que recibe una cadena
terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.


#mayusculas y minusculas rango de letras
#41H-5AH / 61H-7AH no lo use en este
.data
vocal: .asciiz "AEIOUaeiou" 
caracterES: .asciiz "saracatunga"	
contV: .word 0 #1 si es vocal, 0 si no lo es

.code
daddi $sp, $zero, 0x400 #pila
#daddi $a1, $zero, vocal #direc vocal
daddi $a2, $zero, caracterES #direc caracterES
#lbu $a0, caracter($zero) #carga el caracter en $a0

jal validador #llama a validador
sd $v0, contV($zero) #guarda el resultado en la variable Es
halt 



validador: daddi $sp, $sp, -8 #push
sd $ra, 0($sp) #push
dadd $v0, $zero, $zero #inicializa el resultado en 0
lopardo1: lbu $t5, 0($a2) #carga el caracter en $t5
beqz $t5, terminaTodo

#aca tengo que guardar sp - r31xxxxxxxxxxxxxxxxxxxxx
jal es_vocal

daddi $a2, $a2, 1 #incrementa el puntero

j lopardo1

terminaTodo: ld $ra, 0 ($sp) #pop
daddi $sp, $sp, 8 
jr $ra

es_vocal: daddi $a1, $zero, vocal #direc vocal
lopardo: lbu $t0, 0($a1) #carga el primer caracter de la cadena vocal
beqz $t0, fin #me quede sin vocales a comparar, salgo
beq $t5, $t0, es #comparo el caracter con la vocal
daddi $a1, $a1, 1 #paso a la siguiente vocal
j lopardo #vuelvo a comparar

es: daddi $v0, $v0, 1 #si es vocal, incremento el resultado

fin: jr $ra
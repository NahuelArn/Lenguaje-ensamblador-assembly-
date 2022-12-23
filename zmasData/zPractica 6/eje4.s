.data 
  control: .word32 0x10000  #control
  data: .word32 0x10008     #data
  clave: .asciiz "huevos1"
  weelcome: .asciiz "81k2398"
  exit: .asciiz "error"
.code
  daddi $a0, $zero, clave #obtengo la direccion de la clave
  lwu $s0, control($zero)
  lwu $s1, data($zero)
  
  jal char

halt

char: lbu $t3, 0($a0) #cargo el caracter de mi vector "clave" en t3

beqz $t3, cumple #si es 0 sale del looop

daddi $t0, $zero, 9
sd $t0, 0($s0) #le mando a control para que pida un caracter
lbu $t1, 0($s1) #caracter leido en t1


bne $t1, $t3, noCumple


daddi $a0, $a0, 1 #avanzo en mi string
j char

#si llega aca es porq termino de leer 
cumple: daddi $t5, $zero, weelcome 
sd $t5, 0($s1) #le mando a data para que muestre el mensaje

daddi $t4, $zero, 4
sd $t4, 0($s0) #le mando a control para que imprima el mensaje
jr $ra

noCumple: daddi $t0, $zero, 6
sd $t0, 0($s0) #limpia la pantalla

daddi $t1, $zero, exit
sd $t1, 0($s1) #le mando la direccion de exit para q imprima
daddi $t4, $zero, 4 
sd $t4, 0($s0) #le mando el cod 4 q es para imprimir un string (error)
jr $ra #vuelvo


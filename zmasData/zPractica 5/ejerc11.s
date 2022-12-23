.data
  tabla: .word 1,2,3,4,5,0 #impares= 3 / 2 pares
  Cantimpares: .word 0
  Cantpares: .word 0
  mascaraAnd: .byte 1
.code
  daddi $sp, $zero, 0x400
  daddi $a0, $zero, tabla

  jal contarImpar
  sd $a1, Cantimpares($zero)
  sd $a2, Cantpares($zero)
halt
#cuento impares, pares y devolver 1 impar o 0  par
contarImpar: daddi $sp, $sp, -8 #hace el push
  sd $ra, 0($sp) #guarde la direccion de retorno en la pila

  daddi $v0, $zero, 0 
  #contadores 
  daddi $a1, $zero, 0 
  daddi $a2, $zero, 0

  loopardoMain: ld $a3, 0($a0) #me traigo el decimal
  beqz $a3, fin #a3 tine mi decimal| si es =0 salgo

  jal contarImpares 
  daddi $a0, $a0, 8 #avanzo al siguiente en la tabla
  beqz $v0, par

  impar: dadd $a1, $v0, $a1
  j loopardoMain

  par: daddi $a2, $a2, 1 #daddi $a2, $v0, $a2
  j loopardoMain 

fin:  ld $ra, 0($sp) #cadena vacia o llego al final (se podria separar para identificar cada caso)
jr $ra

contarImpares: ld $t9, mascaraAnd($zero)
  and $v0, $a3, $t9 
  jr $ra

  
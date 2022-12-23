#Escribir un programa que recorra una tabla de 5 numeros cargados en memoria y pinte la pantalla grafica en base a ala misma.
#Se debe pintar de color azul las primeras 5 filas (las situadas en la parte superior) de la pantalla grafica. Para cada fila se pintan
#de izquierda a derecha las primeras N_i columnas, donde N_i es el numero i-esimo contenido en la tabla, y el resto se dejan sin pintar
#Si la tabla contiene los valores "3,6,2,5,1", se deben pintar los primeros 3 pixeles de la fila 49, los primeros 6 de la fila 48, etc..
#Suponer que el valor maximo cargado en Tabla no supera 49. Usar la convencion para nombrar a los registros.


.data
  tabla: .word 3,6,2,5,1
  control: .word32 0x10000
  data: .word32 0x10008
  cordX: .byte 0
  cordY: .byte 49
  blue: .byte 0,0, 255,0 #rgba

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $a0, $zero, tabla #direc
  daddi $a1, $zero, 5 #longitud
  jal pintar
  halt

  pintar: #dadd $t0, $zero, $a0 #t0 = DIREC
  dadd $t1, $zero, $a1  #t1 = longitud
  lwu $s3, blue($zero) #me traigo el color
  sw $s3, 0($s1)    #lo guardo
  #ld $t8, 0($t0)   #cargo el 3
  lbu $t6, cordY($zero) # t6= cord Y
  pasador: sb $ 
  dadd $t0, $zero, $a0 #t0 = DIREC
  ld $t8, 0($t0)   #cargo el 3
  loop: lbu $t5, cordX($zero) #t5 =  cord X
    #lbu $t6, cordY($zero)
  casi_loop: sb $t5, 5($zero) #guarda cord X
  sb $t6, 4($zero)    #guarda cord Y
  sd $a1, 0($s0)  #paso el 5 a control para que imprima
  daddi $t5, $t5, 1 #incremento en 1 corX
  daddi $t8, $t8, -1  #incrementa el I de la posicion actual de tabla 3-1=2
  bnez $t8,casi_loop
  daddi $t6, $t6, -1  #decremento en 1 Y 49, 48, 47, 46, 45
  daddi $a0, $a0, 8 #paso al siguiente en mi tabla
  daddi $t1, $t1, -1
  bnez $t1, pasador
  jr $ra

    

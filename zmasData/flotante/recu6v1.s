#Escribir un programa que recorra una tabla de 5 numeros cargados en memoria y pinte la pantalla grafica en base a ala misma.
#Se debe pintar de color azul las primeras 5 filas (las situadas en la parte superior) de la pantalla grafica. Para cada fila se pintan
#de izquierda a derecha las primeras N_i columnas, donde N_i es el numero i-esimo contenido en la tabla, y el resto se dejan sin pintar
#Si la tabla contiene los valores "3,6,2,5,1", se deben pintar los primeros 3 pixeles de la fila 49, los primeros 6 de la fila 48, etc..
#Suponer que el valor maximo cargado en Tabla no supera 49. Usar la convencion para nombrar a los registros.


#ANDANDO
 .data
  tabla: .word 3,6,2,5,1
  control: .word32 0x10000
  data: .word32 0x10008

  cordX: .byte 0
  cordY: .byte 49
  color: .byte 0,0,255,0#rgba
.code

  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $a0, $zero, tabla
  daddi $a1, $zero, 5
  daddi $a3, $zero, 5 #longitud tabla
  jal pintar
halt

  pintar: daddi $a3, $a3, -1
    dadd $t0, $zero, $a0 # t0 = direc de tabla
    dadd $t1, $zero, $a1 # t1 = longitud
    lwu $t2, color($zero) #carga y guardado de color
    sw $t2, 0($s1)
    lbu $t7, cordY($zero)
  control: ld $t5, 0($t0) #me traigo el I actual de tabla
    lbu $t6, cordX($zero)
  fila: sb $t6, 5($s1)
    sb $t7, 4($s1)
    sd $a1, 0($s0) #imprimio 
    daddi $t5, $t5, -1  #le resto a I -1
    daddi $t6, $t6, 1 #me desplazo en la fila
    bnez $t5, fila 
  columna: daddi $a0, $a0, 8
    daddi $t1, $t1, -1
      daddi $t7, $t7, -1
      sb $t7, cordY($zero)
      bnez $a3, pintar
      jr $ra

  

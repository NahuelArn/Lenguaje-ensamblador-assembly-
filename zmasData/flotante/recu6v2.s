#Escribir un programa que recorra una tabla de 5 numeros cargados en memoria y pinte la pantalla grafica en base a la misma.
#Se debe pintar de color azul las primeras 5 filas (las situadas en la parte superior) de la pantalla grafica. Para cada fila se pintan
#de izquierda a derecha las primeras N_i columnas, donde N_i es el numero i-esimo contenido en la tabla, y el resto se dejan sin pintar
#Si la tabla contiene los valores "3,6,2,5,1", se deben pintar los primeros 3 pixeles de la fila 49, los primeros 6 de la fila 48, etc..
#Suponer que el valor maximo cargado en Tabla no supera 49. Usar la convencion para nombrar a los registros.

.data
  control: .word32 0x10000
  data: .word32 0x10008

  tabla: .word 3,6,2,5,1
  cordX: .byte 0
  cordY: .byte 49
  color: .byte 0,0,255,0#rgba

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $a0, $zero, tabla
  daddi $s3, $zero, 5 #imprimir color
  lwu $t0, color($zero)
  sw $t0, 0($s1)
  jal verificar
halt
  verificar: lbu $t0, cordY($zero)
  daddi $t7, $zero, 5 #longitud
  config: lbu $t1, cordX($zero)
  ld $t3, 0($a0)
  #daddi $t8, $zero, 0
  fila: sb $t1, 5($s1)
  sb $t0, 4($s1)
  sd $s3, 0($s0) #imprime
  daddi $t3, $t3, -1
  daddi $t1, $t1, 1
  bnez $t3, fila
  columna: daddi $t6, $zero, 0
    sb $t6, cordX($zero)
    daddi $t0, $t0, -1
    daddi $t7, $t7, -1
    daddi $a0, $a0, 8
    bnez $t7, config
  jr $ra
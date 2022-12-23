#Escribir un programa que recorra una tabla de 5 numeros cargados en memoria y pinte la pantalla grafica en base a la misma.
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
  color: .byte 0,0,255,0#rgba

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $s3, $zero, 5 #cod para imprimir  
  lwu $t0, color($zero)
  sw $t0, 0($s1)

  daddi $a0, $zero, tabla
  daddi $a1, $zero, 5 #longitud

  jal verificar
halt 
  verificar: lbu $t0, cordX($zero)
    lbu $t1, cordY($zero)
  reset: ld $t2, 0($a0) #me traigo I num
  loop: sb $t0, 5($s1)
    sb $t1, 4($s1)
    sd $s3, 0($s0) #imprime
    daddi $t2, $t2, -1
    daddi $t0, $t0, 1
    bnez $t2, loop
    daddi $a0, $a0, 8
    daddi $t0, $zero, 0
    daddi $t1, $t1, -1
    daddi $a1, $a1, -1
    bnez $a1, reset 
    jr $ra
    

.data
  coorX: .byte 0 ; coordenada X de un punto
  coorY: .byte 0 ; coordenada Y de un punto
  color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul => magenta
  CONTROL: .word32 0x10000
  DATA: .word32 0x10008

.text
  lwu $s6, CONTROL($zero) ; $s6 = dirección de CONTROL
  lwu $s7, DATA($zero) ; $s7 = dirección de DATA

  daddi $t0, $zero, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
  sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gráfica

  jal ingresarCoordenadas


  lbu $s0, coorX($zero) ; $s0 = valor de coordenada X
  sb $s0, 5($s7) ; DATA+5 recibe el valor de coordenada X

  lbu $s1, coorY($zero) ; $s1 = valor de coordenada Y
  sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada Y

  lwu $s2, color($zero) ; $s2 = valor de color a pintar
  sw $s2, 0($s7) ; DATA recibe el valor del color a pintar

  daddi $t0, $zero, 5 ; $t0 = 5 -> función 5: salida gráfica
  sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto
halt 

ingresarCoordenadas: daddi $t8, $zero, 8  #ingreso de coordenada X
  sd  $t8, 0($s6) # CONTROL recibe 8 y espera a que se ingrese un punto
  lbu $t1, 0($s7) # DATA recibe la coordenada X

  sb $t1, coorX($zero) # se guarda la coordenada X en la variable coorX

  #ingreso de coordenada Y

  sd $t8, 0($s6)  #en modo de pedir coordenada Y
  lbu $t2, 0($s7) #me traigo el num Y, a t2

  sb $t2, coorY($zero) #guardo el num Y en la variable coorY

  jr $ra
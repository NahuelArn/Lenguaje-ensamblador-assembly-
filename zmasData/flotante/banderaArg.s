#hacer la bandera argentina

.data
  amarillo: .byte 255, 255, 0, 0
  celeste: .byte 64, 207, 255, 0
  blanco: .byte 245, 240, 220, 0
  cordX: .byte 0
  cordY: .byte 0
  control: .word32  0x10000
  data: .word32 0x10008

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  lwu $s2, celeste($zero)
  daddi $t6, $t6, 1 #flag
  #daddi $a0, $zero, 2 #longitud ancho #necesito tenerlo en cada columna
  daddi $a0, $zero, 20 #long alto
  jal celesteAbajo
  daddi $a0, $zero, 10 #long alto2
  jal blancoMid
  lwu $s2, celeste($zero)
  daddi $a0, $zero, 20 #long alto3
  daddi $t6, $t6, -1
  jal celesteAbajo

halt
  celesteAbajo: daddi $s3, $zero, 5
  sw $s2, 0($s1)
  beqz $t6, columna
  lbu $t2, cordY($zero)
  columna: lbu $t1, cordX($zero)
  daddi $t3, $zero, 50 #ancho longitud                     1 config
  loop: sb $t1, 5($s1) #cord X
    sb $t2, 4($s1)      #CORD Y
    sd $s3, 0($s0)
    
    daddi $t1, $t1, 1
    daddi $t3, $t3, -1
    bnez $t3, loop
    daddi $t2, $t2, 1
    daddi $a0, $a0, -1
    bnez $a0, columna
    jr $ra
  #t2 Y
  blancoMid:  lwu $t0, blanco($zero)
    sw $t0, 0($s1)
    columna1: lbu $t0, cordX($zero)
    daddi $t7, $zero, 50 #                             2 presta atencion a esto que es la segunda vez q me olvido ANCHO LONGITUD 2
    loop1: sb $t0, 5($s1)
      sb $t2, 4($s1)
      sd $s3, 0($s0)
      daddi $t0, $t0, 1
      daddi $t7, $t7, -1
      bnez $t7, loop1
      daddi $a0, $a0, -1
      daddi $t2, $t2, 1
      bnez $a0, columna1
      jr $ra


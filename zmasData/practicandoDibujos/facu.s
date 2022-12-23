.data
  control: .word32 0x10000
  data: .word32 0x10008

  coordX: .byte 4
  coordY: .byte 20
  color: .byte 0,0,0,0 #COLOR NEGRO  R G B A

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  #limpiamos pantalla grafica 
  daddi $t0, $zero, 7
  sd $t0, 0($s0)

  #siempre me traigo las coordenadas con LBU
  #mando coordenada X
  lbu $t0, coordX($zero)
  sb $t0, 5($s1)

  #coordenada Y
  lbu $t1, coordY($zero)
  sb $t1, 4($s1) 
  
  #cargo el color
  lwu $t2, color($zero)
  sw $t2, 0($s1)
  daddi $t0, $zero, 5
  sd $t0, 0($s0)        #pinta el pixel
halt



.data
  control: .word32 0x10000
  data: .word32 0x10008

  coorX: .byte 20
  coorY: .byte 10
  color: .byte 0,0,0,0 #COLOR NEGRO  R G B A

.code
  #me traigo los valores de entrada y salida
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  
  #me traigo las coordenadas
  lbu $s3, coorX($zero)
  sb $s3, 5($s1) #la cooordenada X se guarda en la poscion 5 de desplazamiento

  lbu $s4, coorY($zero)
  sb $s4, 4($s1) #la coordada X se guarda en la poscion 4 de desplazamiento
  #me traigo el color
  lwu $s5, color($zero)
  sw $s5, 0($s1)

  daddi $t0, $zero, 5
  sd $t0, 0($s0)
halt






.data
  control: .word32 0x10000
  data: .word32 0x10008

  coorX: .byte 2
  coorY: .byte 2

  color: .byte 255, 0,0,0#rgb

.code 
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  lbu $s3, coorX($zero)
  sb $s3, 5($s1)

  lbu $s4, coorY($zero)
  sb $s4, 4($s1)

  lwu $s5, color($zero)
  sw $s5, 0($s1)

  daddi $t0, $zero, 5
  sd $t0, 0($s0)

halt 

.data
  control: .word32 0x10000
  data: .word32 0x10008

  corX: .byte 2
  corY: .byte 2
  color: .byte 255, 0, 0,0

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  lbu $s3, corX($zero)
  sb  $s3, 5($s1)

  lbu $s4, corY($zero)
  sb $s4, 4($s1)

  lwu $s5, color($zero)
  sw $s5, 0($s1)

  daddi $t0, $zero, 5
  sd $t0, 0($s0)

halt





L.D f1, NUM ($0)
S.D f1, 0 ($s1)        

DADDI $t0, $0, 3
SD $t0, 0 ($s0) 




.data
  control: .word32 0x10000
  data: .word32 0x10008
  flotante: .double 2.2
.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)
  
  l.d f1, flotante($zero)
  s.d f1, 0($s1)

  daddi $t1, $zero, 3
  sd $t1, 0($s0)
halt

.data
  control: .word32 0x10000
  data: .word32 0x10008

  vector: .double 1.0, 2.2, 3.3, 4.4, 5.5
  cordX: .byte 0
  cordY: .byte 0
  color: .byte 0,0,0,0 #rgba
  cinco: .double 5.0 #divisor
  cero: .double 0.0
.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)


  daddi $a0, $zero, 5 #longitud
  daddi $a1, $zero, vector #direccion
  lbu $t0, cordX($zero)
  lbu $t1, cordY($zero)
  sb $t0, 5($s1)
  sb $t1, 4($s1) #deje a punto mis coordenadas 
  jal promedio
  jal imprimir 
halt
  promedio: l.d f0, cinco($zero) #divisor
    l.d f1, cero($zero) 
  loop: daddi $a0, $a0, -1
      l.d f5, 0($a1)
      add.d f1, f1, f5 
      bnez $a0, loop
      div.d f10, f1, f0 #f1/f0 y lo guarda en f10
      cvt.l.d f12, f10
      mfc1 $v0, f12
    jr $ra

  imprimir: daddi $t0, $zero, 5
    daddi $t1, $zero, 3
    sb $v0, color($t1)

    lwu $t1, color($zero)
    sw $t1, 0($s1)
    sd $t0, 0($s0)
  jr $ra
    

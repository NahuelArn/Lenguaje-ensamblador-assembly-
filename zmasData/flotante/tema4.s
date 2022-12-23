.data
  a: .word 0
  b: .word 0
  c: .word 0
  res: .word 0
  control: .word32 0x10000
  data: .word32 0x10008

.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $s2, $zero, 8
  daddi $a0, $zero, a
  daddi $a1, $zero, b
  daddi $a2, $zero, c
jal pedir
ld $a0, a($zero)
ld $a1, b($zero)
ld $a2, c($zero)
jal calculo
daddi $t0, $zero, res
sd $v1, 0($t0) #guardo el resultado
daddi $t2, $zero, 2
sd $v1, 0($s1)
sd $t2, 0($s0)
halt

pedir: sd $s2, 0($s0)
  ld $t0, 0($s1)
  sd $t0, 0($a0) #guarde la A
  sd $s2, 0($s0)
  ld $t0, 0($s1)
  sd $t0, 0($a1) #guarde el b
  sd $s2, 0($s0)
  ld $t0, 0($s1)
  sd $t0, 0($s2) #guardo la c
jr $ra

calculo: daddi $v0, $zero, 0
dsub $v1, $a0, $a1
jr $ra

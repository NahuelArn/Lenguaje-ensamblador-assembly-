.data
  control: .word32 0x10000
  data: .word32 0x10008

  cordX: .byte 1
  cordY: .byte 1
  color: .byte 0,255,0,0#rgba

.code
  lwu $s0, control ($zero)
  lwu $s1, data ($zero)

  lbu $s3, cordX($zero)
  sb $s3, 5($s1)

  lbu $s4, cordY($zero)
  sb $s4, 4($s1)

  lwu $s5, color($zero)
  sw $s5, 0($zero)

  daddi $t5, $zero, 5
  sd $t5, 0($s0);

halt

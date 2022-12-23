    .data
CONTROL: .word32    0x10000
DATA:   .word32    0x10008
VALOR:  .double 5.0
TEXTO: .asciiz "El resultado es:"

    .code
    lwu $s6, CONTROL($zero)
    lwu $s7, DATA($zero)

    daddi $s0, $zero, 8
    daddi $s1, $zero, 3
    daddi $s2, $zero, 4

    l.d f1, VALOR($zero)

    sd $s0, 0($s6)
    l.d f2, 0($s7)

    c.lt.d f1, f2

    bc1t XmayorV

    sub.d f0, f1, f2
    div.d f0, f0, f2
    j fin
XmayorV:
    sub.d f0, f2, f1
    mul.d f0, f0, f2
fin:
    daddi $t0, $zero, TEXTO
    sw $t0, 0($s7)
    sd $s2, 0($s6)

    s.d f0, 0($s7)
    sd $s1, 0($s6)

    halt
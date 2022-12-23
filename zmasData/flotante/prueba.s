.data
 a: .word 3
 b: .word 5
 c: .word 0
.code
  ld r1, a(r0)
  ld r2, b(r0)
  dadd r3, r0, r0
#lazo: dadd r3, r3, r2
  #daddi r1, r1, -1
  #sd r3, c(r0)
  #bnez r1, lazo
  #sd r3, c(r0)
  dadd r3, r3, r2
  daddi r1, r1, -1
  dadd r3, r3, r2
  daddi r1, r1, -1
  dadd r3, r3, r2
  daddi r1, r1, -1
  sd r3, c(r0)

halt

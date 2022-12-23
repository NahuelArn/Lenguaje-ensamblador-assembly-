#hallar el max y el min y guardarlo, en la variable max y min

.data
vector: .word 2, 4, 5, 8, 1
max: .word 0
min: .word 0
.code
daddi $a0, $zero, vector
daddi $a1, $zero, 5
jal numerito

numerito: daddi $v0, $zero,  9999
daddi $v1, $zero, -9999

lopardo: ld $t0, 0($a0) #t0 = a elemento actual
daddi $a0, $a0, 8
daddi $a1, $a1, -1

slt $t5, $t0, $v0 #calculo el minmo si me da ok, t5= 1
beqz $t5, actualizarMin
dadd $v0, $zero, $t0

actualizarMin: slt $t6, $v1, $t0
beqz $t6, salgo
dadd $v1, $zero, $t0 
salgo: bnez $a1, lopardo
jr $ra
halt



MIN_MAX:
    daddi $v0, $zero, 9999          ; inicializo minimo en numero muy grande
    daddi $v1, $zero, -9999         ; inicializo máximo en numero muy chico
    dadd $t0, $zero, $a0 #direcccion
    dadd $t3, $zero, $a1    #longitud
loop:
    ld $t1, 0($t0) #me traigo el valor actual
    daddi $t0, $t0, 8               ; muevo un lugar adelante en la tabla
    daddi $t3, $t3, -1              ; disminuyo el contador en 1
    slt $t2, $t1, $v0 #a<b=t2=1
    beqz $t2, sig1                  ; si el mínimo es mas chico que mi numero actual no hago nada
    dadd $v0, $zero, $t1            ; sino actualizo el mínimo con el valor actual
sig1:
    slt $t2, $v1, $t1
    beqz $t2, sig2                  ; si el máximo es mayor que mi numero actual no hago nada
    dadd $v1, $zero, $t1            ; sino actualizo el másximo con el valor actualizo
sig2:
    bnez $t3, loop
    jr $ra
# se cuenta con un arreglo llamado TABLA que contiene 15 elementos. Escribir un programa para WINMIPS64 que genere un nuevo arreglo, a partir de la direccion NUEVO
#que contenga solo aquellos elementos del arreglo TABLA que sean mayores a MAYOR. Tambien se debe establecer la cantidad de elementos de este nuevo arreglo en la direccion CANTIDAD
.data
  tabla: .word 4,11,18,6,17,28,9,11,23,15,6,37,29,14
  #menor: .word 20
  mayor: .word 10
  cantidad: .word 15 #aca iria la cantidad de los que cumplen 
  #total: .word 0
  nuevo: .word 0
.code
  daddi $a0, $zero, tabla # direccion tabla
  ld $a1, mayor($zero)    #a1, mayor
  daddi $a2, $zero, nuevo #a2 direccion nuevo vector
  daddi $a3, $zero, 0 #contador
  jal generar
  sd $a3, cantidad($zero)
halt
  generar: daddi $v0, $zero, 0
  daddi $t8, $zero, 15
  loop: daddi $t8, $t8, -1
    beqz $t8, fin
    ld $t0, 0($a0)
    slt $t1, $t0, $a1 #t0 < a1... t1= 1 #si es 1 no cumple
    bnez $t1, noCumple
    daddi $a0, $a0, 8
    daddi $v0, $v0, 1
    sd $t0, 0($a2)
    daddi $a2, $a2, 8
    daddi $a3, $a3, 1
    j loop
    noCumple: daddi $a0, $a0, 8
    j loop

    fin: jr $ra
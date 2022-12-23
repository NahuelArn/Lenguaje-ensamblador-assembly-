.data 
cant: .word 8 
datos: .word 1, 2, 3, 4, 5, 6, 7, 8 
res: .word 0 
 .code 
 dadd r1, r0, r0 #incializo el r1 en 0
 ld r2, cant(r0)   #cargo el contador de veces a repetir (en este caso 8)
loop: ld r3, datos(r1)  #cargo el primer dato de mi vector (1, 2, 3, etc..)
 daddi r2, r2, -1   #decremento el contador
 dsll r3, r3, 1     #multiplico por 2 con el corrimiento a la izquierda
 sd r3, res(r1) #guardo el (valor contenido en r3) resultado en el vector de resultados
 #daddi r1, r1, 8 
 bnez r2, loop # llego aca y como tengo el delay slot no se ejecuta el bnez, primero se ejecuta el daddi y despues el bnez
 daddi r1, r1, 8 #solo funciona con delay slot, gracias al retardo que me asegura que voy a desplazarme al siguiente en la tabla "vector"
 halt 
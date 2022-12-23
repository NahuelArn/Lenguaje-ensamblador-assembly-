Como ya se observó anteriormente, muchas instrucciones que normalmente forman parte del repertorio de un
procesador con arquitectura CISC no existen en el MIPS64. En particular, el soporte para la invocación a subrutinas
es mucho más simple que el provisto en la arquitectura x86 (pero no por ello menos potente). El siguiente programa
muestra un ejemplo de invocación a una subrutina.


.data
	valor1: .word 2
	valor2: .word 3
	result: .word 0 
 
.text
	ld $a0, valor1($zero) 
	ld $a1, valor2($zero) 
	jal a_la_potencia 
	sd $v0, result($zero) 
halt 
a_la_potencia: daddi $v0, $zero, 1 
lazo:          slt $t1, $a1, $zero 
               bnez $t1, terminar 
               daddi $a1, $a1, -1 
               dmul $v0, $v0, $a0  #2x1 2x2 2x4 2x8 
               j lazo 						 											
 terminar: jr $ra

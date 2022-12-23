.data
	valor1: .word 6 
	valor2: .word 4 
	result: .word 0 

.code
	ld $a0, valor1($zero) #cargo $a0 con 16    #R4 (r4-r7) ax,bx,cx,dx  Argumentos pasados a la subrutina
	ld $a1, valor2($zero)	#$cargo a1 con 4		 #R5 (r4-r7) ax,bx,cx,dx  Argumentos pasados a la subrutina
	jal a_la_potencia  		#SALTO INCONDICIONAL A LA SUBRUTINA JMP y deja en $ra la direccion de retorno
	sd $v0, result($zero) 	#Despues de salir de la subrutina, cargo el resultado en result
halt 
a_la_potencia: daddi $v0, $zero, 1 #cargo en $v0 1    	#valores del retorno (resultados) ala subrutina llamda (R2-R3)
lazo:	 	  slt $t1, $a1, $zero #4<0 ? no entonces $t1 se carga con 0     if a1<$zero me deja un 1 en $t1     	#(r8-r15 y r24-r25) variables temporales, se usan para hacer calculos auxiliares, no se tendrian que salvar
					bnez $t1, terminar # si $t1 no es igual a 0 va a salta a terminar... $t1 <> 0 no salta
					daddi $a1, $a1, -1  #a $a1 le resto 1.... me queda 3
			 		dmul $v0, $v0, $a0  #hago la multiplicacion( 16x16= 256) y guardo en $v0
					j lazo #salto incondicional a lazo... esto se va a hacer 4 veces y en el cuarto salta a terminar..... 3 2 1 0
terminar: jr $ra #direccion de retorno




.data
	valor1: .word 2
	valor2: .word 4 
	result: .word 0 
 
.text
	ld $a0, valor1($zero) 
	ld $a1, valor2($zero) 
	jal a_la_potencia 
	sd $v0, result($zero) 
halt 
a_la_potencia: daddi $1, $zero, 1 
lazo:          slt $t1, $a1, $zero 
               bnez $t1, terminar 
               daddi $a1, $a1, -1 
               dmul $v0, $v0, $a0  #2x1 2x2 2x4 2x8 
               j lazo 						 											
 terminar: jr $ra 								




ld $a0= 2 
ld $a1= 4
$v0 = 1
#PRIMERA VUELTA
a_la_potencia: daddi $v0, $zero, 1 #V0= 1
lazo:          slt $t1, $a1, $zero  #4<0 ? no, entonces $t1 se carga con 0
               bnez $t1, terminar 	# si t1= a 0 termina el programa
               daddi $a1, $a1, -1 		#4-1= 3 seria mi contador de vueltas
               dmul $v0, $v0, $a0  # 1X2= 2.... el 2 lo guarda en $v0
               j lazo 

ld $a0= 2 
ld $a1= 3
$v0= 2
#SEGUNDA VUELTA

lazo:          slt $t1, $a1, $zero # 3<0 ? no, entonces $t1 se carga con 0
               bnez $t1, terminar #SI ES 0 TERMINA EL PROGRAMA
               daddi $a1, $a1, -1 	#3-1= 2 seria mi contador de vueltas
               dmul $v0, $v0, $a0  # 2X2= 4.... el 4 lo guarda en $v0
               j lazo 
#TERCER VUELTA
ld $a0= 2 
ld $a1= 2
$v0= 4
lazo:          slt $t1, $a1, $zero  # 2<0 ? no, entonces $t1 se carga con 0
               bnez $t1, terminar 		#SI ES 0 TERMINA EL PROGRAMA
               daddi $a1, $a1, -1  #2-1= 1 seria mi contador de vueltas
               dmul $v0, $v0, $a0  # 4X2= 8.... el 8 lo guarda en $v0
               j lazo
#CUARTA VUELTA
 ld $a0= 2 
ld $a1= 1
$v0= 8
lazo:          slt $t1, $a1, $zero 		# 1<0 ? no, entonces $t1 se carga con 0
               bnez $t1, terminar  		#SI ES 0 TERMINA EL PROGRAMA
               daddi $a1, $a1, -1 		#1-1= 0 seria mi contador de vueltas
               dmul $v0, $v0, $a0  # 	8X2= 16.... el 16 lo guarda en $v0
               j lazo 

#QUINTA VUELTA
ld $a0= 2 
ld $a1= 0
$v0= 8
lazo:          slt $t1, $a1, $zero # 		0<0 ? si, entonces $t1 se carga con 1
               bnez $t1, terminar  		#SI ES 1 TERMINA EL PROGRAMA
               daddi $a1, $a1, -1 	
               dmul $v0, $v0, $a0  
               j lazo 


































$V0=  $a0=2
 #2X1=2 												



 

.data
    VALOR1: .word 2
    VALOR2: .word 7
    RES:    .word 0
    
.text
    ld $2, VALOR1($zero)   ; a = 16
    ld 7, VALOR2($zero)   ; a1 = 4
    jal a_la_potencia       ; Salta y guarda la dir en R31

		
    sd $v0, RES(0)      ; Muesto el valor de retorno de la subrutina
    halt

    a_la_potencia: daddi $v0(1,), 0, 1  ; Incremento v0
        
				lazo: slt $t1, 7, 0   (0)7<0    ; si a1 < 0 deja un 1 en t1
        bnez $t1, terminar              ; cuando t1 llega a 0 termino
        daddi 7, 7, -1              ; decremento a1
        dmul $v0, $v0, $2 1x2 , 2x2 4x2 8x2           ; v0 = v0 * a0
        j lazo

    terminar: jr $ra








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
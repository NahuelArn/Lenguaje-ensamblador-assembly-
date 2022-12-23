# ESTE ENUNCIADO ESTABA EN UNO DE LOS PARCIALES QUE VIMOS EN CLASE.

#  escriba un programa que lea una cadena de caracteres por teclado
#  hasta que se lea el 0, el programa deberá imprimmir la cadena ingresada
#  en orden normal, e inverso

.data
  cadenaLeida: .asciiz "" # cadena a cargar
  control: .word32 0x10000
  data: .word32 0x10008
  comodin: .asciiz ""
.code
  lwu $s0, control($zero)
  lwu $s1, data($zero) 

  daddi $s3, $zero, cadenaLeida #direc de mi vector
  dadd $s4, $zero, $s3 #puntero al ultimo caracter leido
  daddi $s5, $zero, comodin #direccion de comodin
  daddi $s7, $zero, 0 #contador de caracteres
  #pido el caracter
  loopardo: daddi $t9, $zero, 9
  sd $t9, 0($s0)

  #leo un caracter y lo guardo en mi vector
  ld $t0, 0($s1) #t0 tiene mi caracter
  #validacion que no sea 0
  beqz $t0, imprimir
  #lo guardo en el vector
  sd $t0, 0($s4) 
  #contador q me va decir cuantas veces lei
  daddi $s7, $s7, 1
  #incremento el puntero del vector
  daddi $s4, $s4, 1 #aumento el puntero del vector
  j loopardo
  
  #si estoy aca signfica q sali y tengo e inprimir normal y al reves

  #s7 contador, s3 puntero del vector al inicio // s4 puntero al ultimo caracter leido
  #orden normal
  imprimir: sd $s3, 0($s1) 
  daddi $t0, $zero, 4
  sd $t0,  0($s0)
  
  #orden inverso
  daddi $s4, $s4, -1 #menos 1, por el 0 q me cortaba y lei (creo que no lo cargue.. seguro q no lo carga[])
  looop: ld $t5, 0($s4) #me traigo el num en t5
  sd $t5, comodin($zero) #lo guardo en el comodin el caracter

  sd $s5, 0($s1) # le mando la direc de comodin a data
  sd $t0, 0($s0) #imprimo el comodin 

  daddi $s4, $s4, -1 #me muevo al anterior caracter
  daddi $s7, $s7, -1 #disminuyo el contador

  bnez $s7, looop #si s7 no es 0, vuelvo a imprimir
halt

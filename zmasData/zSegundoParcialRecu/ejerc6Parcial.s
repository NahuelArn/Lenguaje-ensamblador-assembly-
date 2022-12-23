#Escribir la subrutina MIN_MAX que recibe la direccion de comienzo de una tabla y la cantidad de elementos y devuelve el valor maximo y el minimo de dicha tabla. 
#Usando la subrutina, implementar un programa que obtenga el min y el max de 2 tablas. Por ultimo, imprimir en la pantalla grafica un punto de color (255,0,0,0) en la coordenadas
#(minimo_tabla!,  maximo_tabla2) y otro de color Verde(0,255,0,0) en la coordenada ( minimo_tabla2, maximo tabla! ). Usar la convencion para nombrar a los registros.

.data
  tabla_1: .word 21, 12, 5, 16, 8, 39, 10, 41, 4, 33
  tabla_2: .word 32, 24, 15 32, 17, 28, 11, 20, 44, 21
  control: .word32 0x10000
  data: .word32 0x10008
  color: .byte 255, 0, 0, 0
  verde: .byte 0, 255, 0, 0 


.code
  lwu $s0, control($zero)
  lwu $s1, data($zero)

  daddi $s4, $zero, tabla_1 # s4= a direc de tabla 1
  daddi $s5, $zero, tabla_2 # s5= a  direc de tabla 2
  daddi $s6, $zero, 10
  
  dadd $a0, $zero, $s4    #esto para que pueda reutilizar mi subrutina generico
  jal MIN_MAX

  min_max: daddi $v0, $zero, 999    #valor max
  daddi $v1, $zero, -999             #valor min

  loop: nop
  ld $t5, 0($a0) #me traigo el valor actual
  slt $t8, $t5, $v0  #t5<999
  bnez $t8, actualizarMax
  j actualizarMin
  actualizarMax: daddi $v0, $zero, $t5 #pongo el valor que acabo de leer como maximo
  daddi $a0, $a0, 8
  j loop
  actualizarMin: daddi $v1, $zero, $t5


halt
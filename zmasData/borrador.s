#par e impar
.data
.code
  daddi r2, $zero, 3 #cargar num a verifcar
  andi r4, r2, 1    #si ese numero es impar va dejar un 1 en r1, 
                    #si es par va a dejar un 0
halt
 
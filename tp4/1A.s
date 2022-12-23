MIPS

Muchas instrucciones comunes en procesadores con arquitectura CISC no forman parte del repertorio de instrucciones del
MIPS64, pero pueden implementarse haciendo uso de una única instrucción. Evaluar las siguientes instrucciones, indicar qué
tarea realizan y cuál sería su equivalente en lenguaje assembly del x86.

#MIPS

#a
dadd r1, r2, r0 #r1 = r2 + r0       suma r2 + r0 

#b
daddi r3, r0, 5 #r3 = r0 + 5        inicializa r3 con 5

#c
dsub r4, r4, r4 #r4 = r4 - r4       resta

#d
daddi r5, r5, -1 #r5 = r5 - 1      resta 1 a r5

#e
xori r6, r6 , 0xffffffffffffffff #r6 = r6 xor 0xffffffffffffffff   aplica xor a r6
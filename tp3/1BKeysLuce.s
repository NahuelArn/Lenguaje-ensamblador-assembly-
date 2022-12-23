### Uso de las luces y las llaves a través del PIO. Ejecutar los programas bajo la configuración P1 C0 del simulador, que conecta las llaves al puente PA del PIO y a las luces al puerto PB

Escribir un programa que encienda las luces con el patrón 11000011, o sea, solo las primeras y las
últimas dos luces deben prenderse, y el resto deben apagarse.

PA EQU 30H  ;LLAVES ENTRADA
PB EQU 31H   ;LUCES SALIDA
CA EQU 32H  ;LLAVES VALOR DEFAULT
CB EQU 33H   ;LUCES ENTRADA VALOR DEFAULT

ORG 1000H

ORG 2000H
MOV AL, 00000000B ;INICIALIZO MIS LUCES EN 0
OUT CB, AL

MOV AL, 11000011B ;INICIALI MIS LUCES COMO QUIERA QUE SE PRENDAN
OUT PB, AL
INT 0
END
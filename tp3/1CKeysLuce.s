Escribir un programa que permite encender y apagar las luces mediante las llaves. El programa no
deberá terminar nunca, y continuamente revisar el estado de las llaves, y actualizar de forma
consecuente el estado de las luces. La actualización se realiza simplemente prendiendo la luz i si la llave
i correspondiente está encendida (valor 1), y apagándola en caso contrario. Por ejemplo, si solo la
primera llave está encendida, entonces solo la primera luz se debe quedar encendida.

CA EQU 32H ;LLAVES
PA EQU 30H
CB EQU 33H ;LUCES
PB EQU 31H 

ORG 1000H


ORG 2000H
;INICIALIZO LAS LUCES ENTRADA
MOV AL, 0
OUT CB, AL
;INICIALIZO LAS LLAVES SALIDA
MOV AL, 0FFH ;1111 1111
OUT CA, AL 
;-------------------------------------
LOOP: IN AL, PA ;LEO EL ESTADO DE LAS LLAVES Y LO PONGO EN AL

OUT PB, AL ;CARGO EL ESTADO DE LAS LLAVES EN LAS LUCES 
JMP LOOP
INT 0
END
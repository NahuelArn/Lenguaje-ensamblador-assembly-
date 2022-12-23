Es posible convertir valores enteros almacenados en alguno de los registros r1-r31 a su representación equivalente
en punto flotante y viceversa. Describa la funcionalidad de las instrucciones mtc1, cvt.l.d, cvt.d.l y mfc1.

- mtc1 Rx, Fx: Copia los 64 bits del registro entero Rx al registro Fx de punto flotante
- cvt.1.d Fx, Fy: Convierte a entero el valor en punto flotante contenido en Fy, dejándolo en Fx
- cvt.d.1 Fx, Fy: Convierte a punto flotante el valor entero copiado al registro Fy, dejándolo en Fx
- mfc1 Rx, Fx: Copia los 64 bits del registro Fx de punto flotante al registro Rx entero
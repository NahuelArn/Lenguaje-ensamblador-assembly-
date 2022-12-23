.data

	altura: .double 1.7
	peso: .double 85.0
	imc: .double 0.0
	estado: .word 0

	c1: .double 18.5
	c2: .double 25.0
	c3: .double 30.0

.code
	l.d f1, peso(r0)	; f1 = peso
	l.d f2, altura(r0)	; f2 = altura

	mul.d f3, f2, f2	; f3 = altura^2
	div.d f4, f1, f3	; f4 = peso / altura^2

	s.d f4, imc(r0)		; guardo el resultado en IMC

	l.d f5, c1(r0)		; f5 = 18.5
	l.d f6, c2(r0)		; f6 = 25.0
	l.d f7, c3(r0)		; f7 = 30.0

	c.lt.d f4, f5		; evaluo para utilizar el flag FP
	bc1t clas1			; "si f4 < f5 es clasificacion 1"

	c.lt.d f4, f6		; evaluo para utilizar el flag FP
	bc1t clas2			; "si f4 < f6 es clasificacion 2"

	c.lt.d f4, f7		; evaluo para utilizar el flag FP
	bc1t clas3			; "si f4 < f7 es clasificacion 3"

	daddi r1, r0, 4		; POR DESCARTE SI NO FUERON LAS ANTERIORES ES CLASIFICACION 4
	sd r1, estado(r0) 	; estado = 4
	j fin

	clas1: daddi r1, r0, 1
	sd r1, estado(r0)
	j fin

	clas2: daddi r1, r0, 2
	sd r1, estado(r0)
	j fin

	clas3: daddi r1, r0, 3
	sd r1, estado(r0)
	j fin

fin: halt
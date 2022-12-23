.data
  base: .double 5.85
  altura: .double 13.57
	dos: .double 2.0
	superficie: .double 0.0
	
.code

	l.d F1, base (R0)
	l.d F2, altura (R0)
	l.d F4, dos(R0)
	mul.d F5, F1, F2
	div.d F10, F5, f4
	
	s.d F10, superficie(R0)

	halt


Algoritmo LGANTE
	Definir n1, n2, n3 Como Entero
	Escribir "Indique los tres números enteros a comparar:"
	leer n1, n2, n3
	Si n1>n2 Entonces
		Si n1>n3 Entonces
			Si n2<n3
				Escribir "El mayor es " n1 " y el menor es " n2
			FinSi
			Si n2>n3
				Escribir "El mayor es " n1 " y el menor es " n3
			FinSi
		FinSi
		Si n1<n3
			Escribir "El mayor es " n3 " y el menor es " n2

		FinSi
	FinSi
	Si n1<n2 Entonces
		Si n2>n3 Entonces
			Si n1<n3
				Escribir "El mayor es " n2 " y el menor es " n1
			FinSi
			Si n1>n3
				Escribir "El mayor es " n2 " y el menor es " n3
			FinSi
		Fin Si
		Si n2<n3
			Escribir "El mayor es " n3 " y el menor es " n1
		FinSi
	Fin Si
FinAlgoritmo

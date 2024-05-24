Algoritmo eurocum
	Definir monea Como entero
	Definir ndinero Como Real
	Definir total Como Real
	Escribir "Escriba 1 si quiere transformar pesetas en euros, 2 si quiere transformar euros en pesetas."
	leer monea
	Si monea=1
		Escribir "Indique el número de pesetas a convertir:"
		leer ndinero
		total = ndinero/166.386
		Escribir ndinero " pesetas equivalen a " total " euro(s)."
	FinSi
	Si monea=2
		Escribir "Indique el número de euros a convertir:"
		leer ndinero
		total = ndinero*166.386
		Escribir ndinero " euro(s) equivalen a " total " pesetas."
	FinSi
FinAlgoritmo

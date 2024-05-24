Algoritmo gaso
	Definir tipo Como Caracter
	definir nlitros Como Real
	definir presio Como Real
	Escribir "Indique el tipo de combustible (Super95 o Diesel) y el número de litros a repostar"
	leer tipo, nlitros
	Segun tipo Hacer
		"Diesel":
			presio = nlitros*1.734
		"Super95":
			presio = nlitros*1.794
		De Otro Modo:
			Escribir "ERROR: Introduzca un tipo de combustible válido, respetando las mayúsculas y minúsculas."
	Fin Segun
	Escribir "El total a pagar por " nlitros " litros de " tipo " es de " presio " euros."
FinAlgoritmo

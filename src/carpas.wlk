import marcas.*
import personas.*

class Carpa {
	const property limiteGente = 100
	const property tieneBanda
	const property marcaCerveza
	var property personas = []

	method dejaIngresar(persona) {
		return limiteGente >= personas.size() + 1
		and not persona.estaEbrie()
	}
	
	method ingresarA(persona) { personas.add(persona) }
	
	method yaEstaEnLaCarpa(persona) {
		return personas.contains(persona)
	}
}

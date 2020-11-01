import marcas.*
import personas.*

class Carpa {
	var property limiteGente
	var property tieneBanda
	var property marcaCerveza
	var property personas = []

	method dejaIngresar(persona) {
		return limiteGente >= personas.size() + 1
		and not persona.estaEbrie()
	}
	
	method ingresarA(persona) { personas.add(persona) }
	
	method sacarA(persona) { personas.remove(persona) }
	
	method yaEstaEnLaCarpa(persona) {
		return personas.contains(persona)
	}
	
	method servirJarraA_De(persona,capacidadJarra) {
		if (self.yaEstaEnLaCarpa(persona)) {
			persona.comprarJarra(new Jarra(capacidadEnLitros=capacidadJarra,marca=marcaCerveza,carpaServida=self))
		}
		else { self.error("La persona no está en la carpa") }
	}
	
	method cantEbriesEmpedernides() {
		return personas.count( { p=>p.estaEbrie() and p.todasJarrasMasDe1Litro() } )
	}
	
	method esHomogenea() {
		return personas.map( { p=>p.paisOrigen() } ).asSet().size() == 1
	}
	

}

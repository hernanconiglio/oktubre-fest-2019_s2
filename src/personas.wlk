import marcas.*
import carpas.*

class Persona {
	const peso
	var property jarrasQueCompro = []
	const musicaTradicional
	const nivelDeAguante
	const nacionalidad
	
	method musicaTradicional() = musicaTradicional
	
	method estaEbrie() {
		return jarrasQueCompro.sum({j=>j.contenidoDeAlcohol()}) * peso > nivelDeAguante
	}	
	
	method leGusta(birra) {
		return nacionalidad.leGusta(birra)
	}
	
	method totalAlcoholIngerido() {
		return jarrasQueCompro.sum({j=>j.contenidoDeAlcohol()})
	}
	
	method quiereEntrar(carpa) {
		return self.leGusta(carpa.marcaCerveza()) 
		and self.musicaTradicional() == carpa.tieneBanda()
		and nacionalidad.toc(carpa)
	}
	
	method puedeEntrar(carpa) {
		return self.quiereEntrar(carpa) and carpa.dejaIngresar(self)
	}
	
	method ingresarEn(carpa) {
		if (carpa.yaEstaEnLaCarpa(self)) { self.error("Ya esta en la Carpa") }
		else if (self.puedeEntrar(carpa)) { carpa.ingresarA(self) }
		else { self.error("No puede ingresar a la carpa") }
	}
	
	
}

object alemana { 
	
	method leGusta(birra) { return true }
	method toc(carpa) { 
		return carpa.cantGente().even()
	}
}

object belga { 
	
	method leGusta(birra) { return birra.contenidoLupulo() > 4 }
	method toc(carpa) { return true}
}

object checa { 
	
	method leGusta(birra) { return birra.graduacionPorLitro() > 0.08 }
	method toc(carpa) { return true}
}
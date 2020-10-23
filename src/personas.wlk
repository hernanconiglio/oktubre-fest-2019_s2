import marcas.*
import carpas.*

class Persona {
	const peso
	var property jarrasQueCompro = []
	const musicaTradicional
	const nivelDeAguante
	const property paisOrigen
	
	method musicaTradicional() = musicaTradicional
	
	method estaEbrie() {
		return jarrasQueCompro.sum({j=>j.contenidoDeAlcohol()}) * peso > nivelDeAguante
	}	
	
	method leGusta(birra) {
		return paisOrigen.leGusta(birra)
	}
	
	method totalAlcoholIngerido() {
		return jarrasQueCompro.sum({j=>j.contenidoDeAlcohol()})
	}
	
	method quiereEntrar(carpa) {
		return self.leGusta(carpa.marcaCerveza()) 
		and self.musicaTradicional() == carpa.tieneBanda()
		and paisOrigen.toc(carpa)
	}
	
	method puedeEntrar(carpa) {
		return self.quiereEntrar(carpa) and carpa.dejaIngresar(self)
	}
	
	method ingresarEn(carpa) {
		if (carpa.yaEstaEnLaCarpa(self)) { self.error("Ya esta en la Carpa") }
		else if (self.puedeEntrar(carpa)) { carpa.ingresarA(self) }
		else { self.error("No quiere ingresar a la carpa ") }
	}
	
	method salirDe(carpa) {
		if (not carpa.yaEstaEnLaCarpa(self)) { self.error("No esta en la Carpa") }
		else { carpa.sacarA(self) }
	}
	
	method comprarJarra(jarra) {
		jarrasQueCompro.add(jarra)
	}
	
	method todasJarrasMasDe1Litro() {
		return jarrasQueCompro.all( { j=>j.capacidadEnLitros() >= 1 } )
	}
	
	method esPatriota() {
		return if (jarrasQueCompro.size() != 0) { 
				jarrasQueCompro.all( { j=>j.marca().pais() == self.paisOrigen() } )}
				else false
	}
	
	method esCompatibleCon(persona) {
		return self.marcasQueCompro().intersection(persona.marcasQueCompro()).size() > 
		self.marcasQueCompro().union(persona.marcasQueCompro()).size() / 2
	}
	
	method marcasQueCompro() {
		return jarrasQueCompro.map( { j=>j.marca() } ).asSet()
	}
	
	method carpasDondeBebio() {
		return jarrasQueCompro.map( { j=>j.carpaServida() } ).asSet()
	}
	
}

object alemania { 
	
	method leGusta(birra) { return true }
	method toc(carpa) { 
		return carpa.personas().size().even()
	}
}

object belgica { 
	
	method leGusta(birra) { return birra.contenidoLupulo() > 4 }
	method toc(carpa) { return true}
}

object repCheca { 
	
	method leGusta(birra) { return birra.graduacionPorLitro() > 0.08 }
	method toc(carpa) { return true}
}

/*
 * HECHO HASTA EL PUNTO 14 sin testear
 * 
 * const corona = new CervezaRubia(graduacionPorLitro=0.1,contenidoLupulo=2,pais=alemania)
const guiness = new CervezaNegra(contenidoLupulo=2,pais=belgica)
const huguermsas = new CervezaRoja(contenidoLupulo=2,pais=repCheca)
graduacionReglamentaria.valor(0.08)
const pepe = new Persona(peso=80,musicaTradicional=true,nivelDeAguante=10,paisOrigen=alemania)
const juan = new Persona(peso=72,musicaTradicional=false,nivelDeAguante=8,paisOrigen=belgica)
const maggie = new Persona(peso=60,musicaTradicional=true,nivelDeAguante=6,paisOrigen=repCheca)
const robert = new Persona(peso=90,musicaTradicional=true,nivelDeAguante=11,paisOrigen=repCheca)
const carpaAlemana = new Carpa(limiteGente=50,tieneBanda=true,marcaCerveza=corona)
const carpaBelga = new Carpa(limiteGente=80,tieneBanda=false,marcaCerveza=guiness)
const carpaCheca = new Carpa(limiteGente=30,tieneBanda=true,marcaCerveza=huguermsas)

maggie.ingresarEn(carpaAlemana)
carpaAlemana.servirJarraA_De(maggie,1)
pepe.ingresarEn(carpaAlemana)
robert.ingresarEn(carpaCheca)

const jarra1 = new Jarra(capacidadEnLitros=1,marca=guiness)
const jarra2 = new Jarra(capacidadEnLitros=1,marca=corona)
const jarra3 = new Jarra(capacidadEnLitros=1,marca=huguermsas)
const jarra4 = new Jarra(capacidadEnLitros=1,marca=huguermsas)
const jarra5 = new Jarra(capacidadEnLitros=1,marca=huguermsas)
const jarra6 = new Jarra(capacidadEnLitros=1,marca=corona)
const jarra7 = new Jarra(capacidadEnLitros=1,marca=guiness)
juan.comprarJarra(jarra1)
pepe.comprarJarra(jarra2)
 */
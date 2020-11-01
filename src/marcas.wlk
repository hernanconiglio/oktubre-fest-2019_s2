import personas.*

object graduacionReglamentaria {
	var property valor = 0	
}

class Cerveza {
	var property contenidoLupulo = 0 //pero pueden ser const para obligar a pasar por parámetro al crear la instancia
	var property pais //pero pueden ser const para obligar a pasar por parámetro al crear la instancia
	method graduacionPorLitro() //metodo abstracto

}

class CervezaRubia inherits Cerveza {
	
	var property graduacionPorLitro
	
}

class CervezaNegra inherits Cerveza {
	
	override method graduacionPorLitro() {
		return graduacionReglamentaria.valor().min(2 * contenidoLupulo)
	}
}

class CervezaRoja inherits CervezaNegra {
	
	override method graduacionPorLitro() {
		return super() * 1.25
	}
}

class Jarra {
	var property capacidadEnLitros = 0
	const property marca
	const property carpaServida 
	
	method contenidoDeAlcohol() {
		return marca.graduacionPorLitro() * capacidadEnLitros
	}
}
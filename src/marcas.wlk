object graduacionReglamentaria {
	var property valor = 0	
}

class Cerveza {
//	const property marca
	const property contenidoLupulo = 0
	const property pais

}

class CervezaRubia inherits Cerveza {
	var property graduacionPorLitro
	
}

class CervezaNegra inherits Cerveza {
	
	method graduacionPorLitro() {
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
	const marca 
	
	method contenidoDeAlcohol() {
		return marca.graduacionPorLitro() * capacidadEnLitros
	}
}
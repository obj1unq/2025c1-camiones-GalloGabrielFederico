import cosas.*

object camion {
	const property cosas = #{}
	var property pesoMaximo = 2500

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
	  cosas.remove(unaCosa)
	}

	method todoPesoPar() {
	  return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso) {
	  return cosas.any({cosa => self.esElMismoPeso(cosa.peso(), peso)})
	}

	method esElMismoPeso(peso1, peso2) {
	  return peso1 == peso2
	}

	method elDeNivel(nivel) {
	  return cosas.find({cosa => self.mismoNivelDePeligrosidad(cosa.nivelPeligrosidad(), nivel)})
	}

	method mismoNivelDePeligrosidad(nivel1, nivel2) {
	  return nivel1 == nivel2
	}

	method pesoTotal() {
	  return self.tara() + self.peso()
	}

	method tara() {
	  return 1000
	}

	method peso() {
	  return self.pesos().sum()
	}

	method excedidoDePeso() {
	  return self.pesoTotal() > pesoMaximo
	}

	method objetosQueSuperanPeligrosidad(nivel) {
	  return cosas.filter({cosa => cosa.superaPeligrosidadDeNivel(nivel)})
	}

	method objetosMasPeligrososQue(cosa) {
	  return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	  return self.excedidoDePeso() && self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}

	method tieneAlgoQuePesaEntre(min, max) {
	  return cosas.filter({cosa => cosa.peso().between(min, max)})
	}

	method cosaMasPesada() {
	  return cosas.filter({cosa => cosa.peso().max()})
	}

	method pesos() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
	  return self.listaDeBultos().sum()
	}

	method listaDeBultos() {
	  return cosas.map({cosa => cosa.cantidadDeBultos()})
	}
}

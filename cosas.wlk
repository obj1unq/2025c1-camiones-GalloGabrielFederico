object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method superaPeligrosidadDeNivel(nivel) {
	  self.nivelPeligrosidad() > nivel
	}
	method cantidadDeBultos() {
	  return 1
	}
}

object bumblebee {
	var property transformado = auto
	method peso() { return 800 }
	method nivelPeligrosidad() { return transformado.nivelPeligrosidad()}
	method superaPeligrosidadDeNivel(nivel) {
	  self.nivelPeligrosidad() > nivel
	}
	method cantidadDeBultos() {
	  return 2
	}
}

object auto {
  method nivelDePeligrosidad() {
	return 15
  }
}

object robot {
  method nivelDePeligrosidad() {
	return 30
  }
}

object paqueteDeLadrillos {
	const pesoDeLadrillo = 2
	var property cantidadDeLadrillos = 0 
	method peso() { return pesoDeLadrillo * cantidadDeLadrillos }
	method nivelPeligrosidad() { return 2 }
	method superaPeligrosidadDeNivel(nivel) {
	  self.nivelPeligrosidad() > nivel
	}
	method cantidadDeBultos() {
	  return if (cantidadDeLadrillos <= 100){ 1 }
			 else if (cantidadDeLadrillos <= 300) { 2 } else { 3 }
	}
}

object arenaAGranel {
	var property pesoAGranel = 1 
	method peso() { return pesoAGranel }
	method nivelPeligrosidad() { return 1 }
	method superaPeligrosidadDeNivel(nivel) {
	  self.nivelPeligrosidad() > nivel
	}
	method cantidadDeBultos() {
	  return 1
	}
}

object bateriaAntiaerea {
	var property cargado = misil
	method peso() { return cargado.pesoDeCarga() }
	method nivelPeligrosidad() { return cargado.nivelDePeligrosidad() }
	method superaPeligrosidadDeNivel(nivel) {
	  self.nivelPeligrosidad() > nivel
	}
	method cantidadDeBultos() {
	  return 1 + cargado.bulto()
	}
}

object misil {
  method pesoDeCarga() {
	return 300
  }
  method nivelDePeligrosidad() {
	return 100
  }
  method bulto() {
	return 1
  }
}

object otroCaso {
  method pesoDeCarga() {
	return 200
  }
  method nivelDePeligrosidad() {
	return 0
  }
  method bulto() {
	return 0
  }
}

object contenedorPortuario {
	const cosas = #{}
	const pesoVacio = 100

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
	  cosas.remove(unaCosa)
	}

	method peso() { 
		return pesoVacio + self.pesos().sum()
	}

	method pesos() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() { 
		return if (self.nivelesDePeligrosidad().isEmpty()) {
				 0
			   }
			   else {
				 self.nivelesDePeligrosidad().max()
			   }
	}

	method nivelesDePeligrosidad() {
	  return cosas.map({cosa => cosa.nivelDePeligrosidad()})
	}

	method superaPeligrosidadDeNivel(nivel) {
	  return self.nivelPeligrosidad() > nivel
	}

	method cantidadDeBultos() {
	  return 1 + cosas.size()
	}
}

object residuosRadioactivos {
	var property pesoDeResiduos = 0 
	method peso() { return pesoDeResiduos }
	method nivelPeligrosidad() { return 200 }
	method superaPeligrosidadDeNivel(nivel) {
	  self.nivelPeligrosidad() > nivel
	}
	method cantidadDeBultos() {
	  return 1
	}
}

object embalajeDeSeguridad {
	var property cosa = residuosRadioactivos
	method peso() { return cosa.peso() }
	method nivelPeligrosidad() { return cosa.nivelDePeligrosidad() / 2 }
	method superaPeligrosidadDeNivel(nivel) {
	  self.nivelPeligrosidad() > nivel
	}
	method cantidadDeBultos() {
	  return 2
	}
}


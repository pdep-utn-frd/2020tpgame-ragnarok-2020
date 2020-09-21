import wollok.game.*
import fondoDePantalla.*
import personajes.*
import inicio.*
import barraDeVida.*

class Alimentos {
	var property image
	var property position
	var property peso
	
    method ubicacionAleatoria() {
	 	const x = 5.randomUpTo(20).truncate(0)
		const y = 1.randomUpTo(11).truncate(0)
		position = game.at(x,y) 
	}
	
	method choque() {}
	
	method moverseSolo() {}
}

// Otorgan peso

class Comida inherits Alimentos{ 
	
	override method choque(){
		takeda.alimentar(self)
		takeda.masticar()
		takeda.decirPeso()
		game.removeVisual(self)
		game.addVisual(self)
		self.ubicacionAleatoria()
	}	 
}

// Reducen la vida y el peso

class ComidaPodrida inherits Alimentos {
	
	var property danio
	
	method movimientoy(){
		position = position.down(1)
		
		if (position.y() <= 1)
		  self.ubicacionAleatoria()
	}
	
	override method moverseSolo() { 
		game.onTick(1000,"movimiento",{self.movimientoy()})	
	}
	
	override method choque(){
		barraInicial.restarVida()
		takeda.perderPeso(self)
		takeda.masticarP()
		takeda.decirPeso()
		game.removeVisual(self)
		game.addVisual(self)
		self.ubicacionAleatoria()
		
	}
}

// Producen la muerte

class Venenos inherits Alimentos {
	
	override method moverseSolo() { 
		game.onTick(4000,"movimiento",{self.ubicacionAleatoria()})
	}
	
    
	override method choque() { 
		barraInicial.vida(0)
	}	
}

// Declaramos los alimentos buenos, aumentan el peso de Takeda:

const  pescado = new Comida(image="pescado/Pescado.png",peso = 30,position = game.at(5,10))
const  sushi = new Comida(image="pescado/pescado3.png",peso = 50,position=game.at(12,10))
const  carne = new Comida(image="comida/carne.png",peso = 40,position=game.at(19,1))
const  sushi2 = new Comida(image="pescado/sushi.png",peso = 60,position=game.at(5,1))
const manzana = new Comida(image="comida/manzana.png",peso = 20,position=game.at(19,10))

// Declaramos los alimentos podridos, restan salud y disminuyen el peso de Takeda:

const arrozP = new ComidaPodrida(image="comida/arrozP.png",peso = 0, position=game.at(6,4), danio = 20)
const manzanaP = new ComidaPodrida(image="comida/manzanaPodrida.png",peso = 0, position = game.at(16,5),danio = 40)
const pezP = new ComidaPodrida(image="pescado/pezP.png",peso = 0, position = game.at(14,7),danio = 10)

// Declaramos los venenos, matan a Takeda:

const  pezGlobo = new Venenos(image="venenos/globo.png",position=game.at(9,2), peso = null)
const  veneno = new Venenos(image="venenos/veneno.png", position=game.at(6,3), peso = null )

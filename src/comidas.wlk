import wollok.game.*
import fondoDePantalla.*
import personajes.*
import inicio.*

class Alimentos {
	var property image
	var property position
	var property peso
    method movimiento(){
	 	const x = 5.randomUpTo(18).truncate(0)
		const y = 0.randomUpTo(9).truncate(0)
		position = game.at(x,y) 
	 }
	method chocar() 
}

class Comida inherits Alimentos{

	 method moverseSolo(){
	 	game.onTick(3000, "movimiento", { self.movimiento() })
	 }
	 
	 override method chocar(){
  	   	   juegos.tuGanas()
  	   }
}

class Venenos inherits Alimentos {
	
	method moverseSolo() {
		game.onTick(5 * 1000, "movimiento", {self.movimiento()})
	}
	
	override method chocar() {
		juegos.gameOver()
	}
}

// Declaramos los alimentos buenos, dan salud y aumenta el peso de Takeda

const  pescado = new Comida(image="pescado/pescadoA.png",peso=50,position=game.at(6,0))
const  sushi = new Comida(image="pescado/pescadoB.png",peso=40,position=game.at(6,7))
const  carne = new Comida(image="pescado/carne.png",peso=30,position=game.at(13,7))
const  sushi2 = new Comida(image="pescado/sushi.png",peso=80,position=game.at(13,0))

// Declaramos los alimentos podidros, restan salud y disminuyen el peso de Takeda

const pescadoP = new Comida(image="pescado/pescadoP.png",peso=50,position=game.at(6,0))

// Declaramos los venenos, reducen la salud de Takeda

const  pezGlobo = new Venenos(image="venenos/globo.png",position=game.at(6,0), peso = null)
const  veneno = new Venenos(image="venenos/veneno.png", position=game.at(6,0), peso = null)

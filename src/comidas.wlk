import wollok.game.*
import fondoDePantalla.*
import personajes.*
import inicio.*

class Alimentos {
	var property image
	var property position
	var property peso
	method limitadox(){
		var lx
		lx = 0.randomUpTo(20).truncate(0)
		if (lx >= 19) {
			lx = 7
		 	return lx
		 }
		 if (lx <=5) {
				lx = 9	 
				return lx	
		}
		 return lx
	}
	method limitadoy(){
		var ly
		ly = 0.randomUpTo(10).truncate(0)
		if (ly >= 10) {
			ly = 0.randomUpTo(10).truncate(0)
			if (ly >=10){
				ly = 2
			}
		}
		return ly
	}
    method movimientoy(){
	 position = position.up(1)
			//si llega al limite del tablero resetea position	
			if (position.y() == 10) {
				const x = self.limitadox()
				const y = self.limitadoy()
				position = game.at(x,y)
			}
	 }
	 method movimientox(){
	 	position = position.right(1)
			//si llega al limite del tablero resetea position	
			if (position.x() == 19) {
				const x = self.limitadox()
				const y = self.limitadoy()
				position = game.at(x,y)
	 		}
	 }
	method chocar() 
}

class Comida inherits Alimentos{

	 method moverseSolo(){
	 	game.onTick(1000, "movimiento", { self.movimientoy() })
	 }
	 
	 override method chocar(){
  	   	   juegos.tuGanas()
  	   }
}

class Venenos inherits Alimentos {
	
	method moverseSolo() {
		game.onTick(900, "movimiento", {self.movimientox()})
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

const pescadoP = new Comida(image="pescado/pescadoB.png",peso=50,position=game.at(6,0))

// Declaramos los venenos, reducen la salud de Takeda

const  pezGlobo = new Venenos(image="venenos/globo.png",position=game.at(9,0), peso = null)
const  veneno = new Venenos(image="venenos/veneno.png", position=game.at(6,0), peso = null)

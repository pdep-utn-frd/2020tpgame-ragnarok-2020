import wollok.game.*
import fondoDePantalla.*
import personajes.*
import inicio.*
import barraDeVida.*

class Alimentos {
	var property image = 0
	var property position = 0
	var property peso = 0
	const anchoE = 18
	const alturaE = 9
	
method limitadox(){
	var lx
	lx=0.randomUpTo(20).truncate(0)
	 if (lx >= 19){
	 	lx = 7
	 	return lx
	 }
	 if (lx <=5){
	 	lx = 9
	 	return lx
	 }
	 return lx
}
method limitadoy(){
	var ly
	ly = 0.randomUpTo(10).truncate(0)
	 if(ly >= 10){
	 	ly = 0.randomUpTo(10).truncate(0)
	 	 if (ly>=10){
	 	 	ly = 2
	 	 }
	 }
	 return ly
}
method movimientoy(){
	position = position.up(1)
	     //si llega al limite del tablero resetea position
	        if (position.y() == 10){
	        	const x = self.limitadox()
	        	const y = self.limitadoy()
	        	position = game.at(x,y)
	        }
}
method movimientox(){
	position = position.right(1)
	      //si llega al limite del tablero resetea position
	      if(position.x()==18){
	      	const x = self.limitadox()
	      	const y = self.limitadoy()
	      	position = game.at(x,y)
	      }	
}
    method ubiAleatoria(){
	 	const x = 5.randomUpTo(anchoE).truncate(0)
		const y = 0.randomUpTo(alturaE).truncate(0)
		position = game.at(x,y) 

 }
}

class Comida inherits Alimentos{

	 
	
	 method choque(){
	 	takeda.Alimentar(self)
	 	takeda.decirPeso()
	 	game.removeVisual(self)
	 	game.addVisual(self)
 	    self.ubiAleatoria()
      }
	 method moverseSolo(){
	 	game.onTick(1000, "movimiento", { self.movimientoy() })
	 }
	 
	 
}

class ComidaPodrida inherits Alimentos {
	    var property danio
		method moverseSolo(){
	 		game.onTick(1000, "movimiento", { self.movimientoy() })
	 	}
	    method choque(){
	      barraInicial.restarVida()	
	      barraInicial.actualizar()
	      game.removeVisual(self)
	      game.addVisual(self)
	      self.ubiAleatoria()
	    }
	  
	
}
//los venenos restan vida 
class Venenos inherits Alimentos {
	
	var property danio
	method choque(){
		barraInicial.restarVida()	
	    barraInicial.actualizar()
		game.removeVisual(self)
		game.addVisual(self)
	    self.ubiAleatoria()
		
     }
	method moverseSolo() {
		game.onTick(900, "movimiento", {self.movimientox()})

	}
	
	
}

// Declaramos los alimentos buenos, dan salud y aumenta el peso de Takeda
//estos son los alimentos buenos
const  pescado = new Comida(image="pescado/pescadoA.png",peso=30,position=game.at(8,3))
const  sushi = new Comida(image="pescado/pescadoB.png",peso=40,position=game.at(15,7))
const  carne = new Comida(image="pescado/carne.png",peso=10,position=game.at(13,7))
const  sushi2 = new Comida(image="pescado/sushi.png",peso=80,position=game.at(13,0))

// Declaramos los alimentos podidros, restan salud y disminuyen el peso de Takeda

const pescadoP = new ComidaPodrida(image="pescado/pezPodrido.png",peso=50,position=game.at(6,4),danio=25)


// Declaramos los venenos, reducen la salud de Takeda


const  pezGlobo = new Venenos(image="venenos/globo.png",position=game.at(9,0), peso = null, danio = 25)
const  veneno = new Venenos(image="venenos/veneno.png", position=game.at(6,0), peso = null, danio = 25)


import wollok.game.*
import fondoDePantalla.*
import personajes.*
import inicio.*

class Comida{
	var property image
	var property peso
	var property position 
	 method movimiento(){
	 	const x = 5.randomUpTo(18).truncate(0)
		const y = 0.randomUpTo(9).truncate(0)
		position = game.at(x,y) 
	 }
	 method moverseSolo(){
	 	game.onTick(3000, "movimiento", { self.movimiento() })
	 }
	 method chocar(){
  	   	   juegos.tuGanas()
  	   }
	 
	 
}

const  pescado = new Comida(image="pescado/pescadoA.png",peso=50,position=game.at(6,0))
const  sushi = new Comida(image="pescado/pescadoB.png",peso=40,position=game.at(6,7))
const  carne = new Comida(image="pescado/carne.png",peso=30,position=game.at(13,7))
const  sushi2 = new Comida(image="pescado/sushi.png",peso=80,position=game.at(13,0))

  class Visual{
  	 var property image
  	 var property position
  	
  }
  
  object pezGlobo inherits Visual(image="venenos/globo.png",position=game.at(6,0)){
  	
  	   method chocar(){
  	   	   juegos.gameOver()
  	   }
  	}
  	
  //terminar	
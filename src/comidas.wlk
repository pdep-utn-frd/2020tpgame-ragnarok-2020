import wollok.game.*
import fondoDePantalla.*
import personajes.*
import inicio.*
import barraDeVida.*

class Alimentos {
	var property image = 0
	var property position = 0
	var property peso = 0
	const anchoDeEscenario = 19
	const alturaDeEscenario = 11

	
    method ubicacionAleatoria(){
	 	const x = 5.randomUpTo(anchoDeEscenario).truncate(0)
		const y = 1.randomUpTo(alturaDeEscenario).truncate(0)
		position = game.at(x,y) 

 }
}

class Comida inherits Alimentos{
	
	 method choque(){
	 	takeda.Alimentar(self)
	 	takeda.decirPeso()
	 	game.removeVisual(self)
	 	game.addVisual(self)
 	    self.ubicacionAleatoria()
      }	 
}

class ComidaPodrida inherits Alimentos {
	  
	    var property danio 
	

method limitadox(){
	var lx 
	  lx = 0.randomUpTo(20).truncate(0)
	   if (lx>=19){
	   	 lx = 7
	   	  return lx
	   }
	   if (lx <= 5){
	   	  lx = 9
	   	  return lx
	   }
	   return lx
}	
method limitadoy(){
	 var ly
	 ly = 0.randomUpTo(10).truncate(0)
	  if ( ly >= 10 || ly <= 1){
	  	  ly = 0.randomUpTo(10).truncate(0)
	  	   if (ly>=10|| ly <= 1){

	  	   	ly=5
	  	   }
	  }
	 return ly
}

   method moverseSolo(){
   	game.onTick(1000,"movimiento",{self.movimientoy()})
   }


 method movimientoy(){
	position = position.down(1)
	     //si llega al limite del tablero resetea position
	        if (position.y() <= 1){
	        	const x = self.limitadox()
	        	const y = self.limitadoy()
	        	position = game.at(x,y)
	        }
}
method movimientox(){
	position = position.right(1)
	      //si llega al limite del tablero resetea position
	      if( position.x()==19){
	      	const x = self.limitadox()
	      	const y = self.limitadoy()
	      	position = game.at(x,y)
	      }	
      }
      method choque(){
      	barraInicial.restarVida()
      	barraInicial.actualizar()
      	takeda.perderPeso(self)
      	takeda.decirPeso()
      	game.removeVisual(self)
      	game.addVisual(self)
      	self.ubicacionAleatoria()
      }

}


//los venenos te matan
class Venenos inherits Alimentos {
	
    method moverseSolo(){ 
    	game.onTick(4000,"movimiento",{self.ubicacionAleatoria()})
    }
    
	method choque(){
		juegos.gameOver()
		
     }
	
	
	
	
}

// Declaramos los alimentos buenos, aumenta el peso de Takeda
//estos son los alimentos buenos :

const  pescado = new Comida(image="pescado/Pescado.png",peso=30,position=game.at(5,10))
const  sushi = new Comida(image="pescado/pescado3.png",peso=50,position=game.at(12,10))
const  carne = new Comida(image="comida/carne.png",peso=40,position=game.at(19,1))
const  sushi2 = new Comida(image="pescado/sushi.png",peso=60,position=game.at(5,1))
const manzana = new Comida(image="comida/manzana.png",peso = 20,position=game.at(19,10))

// Declaramos los alimentos podridos, restan salud y disminuyen el peso de Takeda

const arrozP = new ComidaPodrida(image="comida/arrozP.png",position=game.at(6,4), danio = 20)
const manzanaP = new ComidaPodrida(image="comida/manzanaPodrida.png",position = game.at(16,5),danio = 40)
const pezp = new ComidaPodrida(image="pescado/pezP.png",position = game.at(14,7),danio = 10)

// Declaramos los venenos, reducen la salud de Takeda
const  pezGlobo = new Venenos(image="venenos/globo.png",position=game.at(9,2), peso = null)
const  veneno = new Venenos(image="venenos/veneno.png", position=game.at(6,3), peso = null)


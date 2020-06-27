import wollok.game.*
import fondoDePantalla.*
import inicio.*

class Sumo{
	var property image
	var property position
	var property peso
  method movimiento(){
	keyboard.w().onPressDo {self.subir()}
	keyboard.d().onPressDo {self.derecha()}
	keyboard.s().onPressDo {self.bajar()}
	keyboard.a().onPressDo {self.izquierda()}
     }
     method subir(){
     	position = position.up(1)
     }
     method derecha(){
     	position = position.right(1)
     }
     method izquierda(){
     	position = position.left(1)
     }
     method bajar(){
     	position = position.down(1)
     }
}

object takeda inherits Sumo(image="sumos/takeda.png",position=game.center(),peso=100){
	  
	  method siChoca(){
	  	juegos.gameOver()
	  }
	
	  	
  }
	
	
	
	//terminarhoy
	
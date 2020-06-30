import wollok.game.*
import fondoDePantalla.*
import inicio.*
//la clase sumo nos permite manejar distintos sumos

class Sumo{
	var property image
	var property position
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

object takeda inherits Sumo(image="sumos/takeda.png",position=game.center()){
     var property peso = 0
        
        method decirPeso(){
        	game.say(self,"mi peso es "+ self.peso()+" por el momento")
        }
        method sumarPeso(kilos){
        	return peso+=kilos
        } 
   	   method Alimentar(comida){
   	   	return  self.sumarPeso(comida.peso())
   	   }
   
      method ganar(){
  	     if (self.peso() > 500)
  	          self.tuGanas()
  	       
      }
       method tuGanas(){
      	game.clear()
      	game.width(25)
      	game.height(13)
      	game.title("ConSumo")
      	game.addVisual(ganaste)
      	game.ground("img/celdaC.png")
      	keyboard.f().onPressDo {juegos.escenarios()}
      	keyboard.p().onPressDo{game.stop()}
        	
        }
	  
	  }  
	
object sumoMalo inherits Visual(image="sumos/malo.png",position=game.at(5,3)){
	var property finalX =18
	var  property finalY = 3
	  method moverse(){
	  	 position = position.right(1)
	  }
	  method volver(){
	  	position = game.at(5,3)
	  }
	  
	  method hastaFinal(){
	  	game.onTick(800,"movimiento",{if (position ==game.at(finalX,finalY))
	  		self.volver()
	  		else
	  		  self.moverse()
	  	})
	  }
	 method choque(){
	   takeda.derecha()
	 }
	

	}
	
 
	
class Visual{
	var property image
	var property position = game.origin()
}	
	//terminarhoy
	
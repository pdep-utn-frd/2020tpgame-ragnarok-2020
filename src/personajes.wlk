import wollok.game.*
import fondoDePantalla.*
import inicio.*
import barraDeVida.*
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
     	  if (position.y() == 11){
     	  	const x = position.x()
     	  	const y = 10
     	  	position = game.at(x,y)
     	  }
          }
     method derecha(){
     	position = position.right(1)
     	if (position.x() == 20){
     		const x = 19
     		const y = position.y()
     		position = game.at(x,y)
     	}
         }
     method izquierda(){
     	position = position.left(1)
     	 if(position.x() == 4){
     	 	const x = 5
     	 	const y = position.y()
     	 position = game.at(x,y)	
     	 }
     }
     method bajar(){
     	position = position.down(1)
     	 if (position.y() == 0){
     	 	const x = position.x()
     	 	const y = 1
     	 	 position = game.at(x,y)
     	 }
     }
}

object takeda inherits Sumo(image="sumos/takeda.png",position=game.center()){
	
        var property peso = 0
        
        method decirPeso(){
        	game.say(self,"mi peso es "+ (self.peso()).max(0)+" kg por el momento")
        }
        method sumarPeso(kilos){
        	 peso += kilos
        } 
        method restarPeso(perder){
	      	  peso -= perder
	      }
	    method perderPeso(comida){
	    	 self.restarPeso(comida.danio())
	    }
   	   method alimentar(comida){
   	        self.sumarPeso(comida.peso())
   	   }
   	   method rebotar(){
   	   	position = position.right(3)
   	   }
   
      method ganar(){
  	     if (self.peso() > 500)
  	          self.tuGanas()
  	       else
  	         if (barraInicial.vida()==0)
  	            juegos.gameOver()
      }
      
       method tuGanas(){
      	game.clear()
      	game.width(25)
      	game.height(13)
      	game.title("ConSumo")
      	game.addVisual(ganaste)
      	game.ground("img/celdaC.png")
      	keyboard.h().onPressDo{game.stop()}
        	
        }
	  
	  }  
	
object sumoMalo {
	var property finalX =18
	var  property finalY = 3
	var property position =  game.at(5,3)
	
	  method moverse(){
	  	 position = position.right(1)
	  }
	  method image() = "sumos/malo.png"
	 
	  method volver(){
	  	position = game.at(5,finalY)
	  }
	  
	  method hastaFinal(){
	  	game.onTick(800,"movimiento",{if (position ==game.at(finalX,finalY))
	  		self.volver()
	  		else
	  		  self.moverse()
	  	})
	  }
	 method choque(){
	   takeda.rebotar()
	 }
	}
	
//septiembre

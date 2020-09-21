import wollok.game.*
import fondoDePantalla.*
import inicio.*
import barraDeVida.*

object takeda {
	
	var property peso = 0    
	var property image = "sumos/takeda.png"
	var property position = game.center()
	
	method masticar(){
		sonidoDeMasticar.first().play()
		sonidoDeMasticar.clear()
		sonidoDeMasticar.add(game.sound("sonido/sMasticar.mp3"))
	}
	
	method masticarP() {
		sonidoDeMasticarP.first().play()
		sonidoDeMasticarP.clear()
		sonidoDeMasticarP.add(game.sound("sonido/sMasticarP.mp3"))
	}
        
    method movimiento() {
    	keyboard.w().onPressDo {self.subir()}
	    keyboard.d().onPressDo {self.derecha()}
	    keyboard.s().onPressDo {self.bajar()}
	    keyboard.a().onPressDo {self.izquierda()}
    }
    
    method subir() {
    	position = game.at(position.x(), (position.y() + 1).min(10))
    }
    
    method bajar() {	
    	position = game.at(position.x(), (position.y() - 1).max(1))
    }    
    
    method derecha() {
    	position = game.at((position.x() + 1).min(19), position.y())
    }
    
    method izquierda() {
    	position = game.at((position.x() - 1).max(5), position.y())
    }
    
    method decirPeso() = game.say(self,"mi peso es "+ (self.peso()).max(0)+" kg por el momento")
    
    method sumarPeso(kilos) {
    	peso += kilos
    }
    
    method restarPeso(perder) {
    	peso -= perder
	}
	
	method perderPeso(comida) {
		self.restarPeso(comida.danio())
	}
	
	method alimentar(comida) {
		self.sumarPeso(comida.peso())
   	}
   	
   	method rebotar() {
   		position = position.right(3)
   		return position
    }
    
    method ganar() {
    	
    	if (self.peso() > 500)
  	      self.tuGanas()
  	      
  	    else
  	      if (barraInicial.vida() == 0 or position.x() > 19)
  	        juegos.gameOver()
    }
    
    method tuGanas() {
    	game.clear()
      	game.width(25)
      	game.height(13)
      	game.title("ConSumo")
      	game.addVisual(ganaste)
      	game.ground("img/celdaC.png")
      	musicaDeTriunfo.play()
      	keyboard.h().onPressDo{game.stop()}   	
    }	  
}  
	
object sumoMalo {
	
	var property finalX =18
	var  property finalY = 3
	var property position =  game.at(5,3) 
	
	method moverse() {
	  	 position = position.right(1)
	}
	
	method golpear() {
		sonidoDeGolpe.first().play()
		sonidoDeGolpe.clear()
		sonidoDeGolpe.add(game.sound("sonido/sGolpe.mp3"))
	}
	
	method image() = "sumos/malo.png"
	
	method volver() {
	  	position = game.at(5,finalY)
	}
	
	method hastaFinal() {
		
		game.onTick(800,"movimiento",{
			
			if (position ==game.at(finalX,finalY))
			  self.volver()
			
			else
			  self.moverse()})
	}
	
	method choque() { 
		self.golpear()
		takeda.rebotar()
		}	
}
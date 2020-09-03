import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*
//la barra de vida debe reducirse cada vez que el personajes choca con un alimento podrido

object barraInicial {

	var property position=game.at(11,11)
	var  property vida = 100
		
	 method image()="escenarios/barra" + vida + ".png"
	 
      method restarVida(){
      	 vida = vida - 25
      }

     }

	//	var property image ="escenarios/barra100.png"
//      method actualizar(){
////      	game.removeVisual(self)
//      	   self.image()
////      	image = archivo + (self.vida()).max(0) +".png"
////      	game.addVisual(self)
//      }
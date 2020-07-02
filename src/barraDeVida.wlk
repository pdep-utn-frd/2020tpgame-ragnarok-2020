import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*
//la barra de vida debe reducirse cada vez que el personajes choca con un alimento podrido

object barraInicial {
	var property image ="escenarios/barra100.png"
	var property position=game.at(11,11)
	var  property vida = 100
	const archivo = "escenarios/barra"
      method actualizar(){
      	game.removeVisual(self)
      	image = archivo + (self.vida()).max(0) +".png"
      	game.addVisual(self)
      }
      method restarVida(){
      	 vida = vida - 25
      }

     }

	

	 import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*

object juegos{
	const ancho = 25
	const altura = 13
     method iniciar(){
     	game.clear()
     	game.width(ancho)
     	game.height(altura)
     	game.title("conSumo")
     	game.ground("img/cieloC.png")
     	game.addVisual(menu)
     	keyboard.enter().onPressDo {self.escenarios()}
     	}
     method escenarios(){
     	game.clear()
     	game.width(ancho)
     	game.height(altura)
     	game.title("consumo")	
     	game.addVisual(escenario)
     	game.addVisual(bordeIzquierdo)
     	game.addVisual(bordeDerecho)
     	game.addVisual(takeda)
     	takeda.movimiento()
     	[pescado,sushi,sushi2,carne].forEach({pez=>game.addVisual(pez)  pez.moverseSolo()})
     	[pescadoP].forEach({pez=>game.addVisual(pez)  pez.moverseSolo()})
     	[pezGlobo, veneno].forEach({unVeneno=>game.addVisual(unVeneno) unVeneno.moverseSolo()})
     	game.whenCollideDo(takeda,{elemento=>elemento.chocar()})
     	game.ground("img/cieloC.png")   	
        }
        method tuGanas(){
        	game.clear()
        	game.width(ancho)
        	game.height(altura)
        	game.title("ConSumo")
        	game.addVisual(ganaste)
        	game.ground("img/celdaC.png")
        	keyboard.f().onPressDo {self.iniciar()}
        	keyboard.p().onPressDo{game.stop()}
        	
        }
        method gameOver(){
        	game.clear()
        	game.width(ancho)
        	game.height(altura)
        	game.title("ConSumo")
        	game.addVisual(perdiste)
        	game.ground("img/celdaC.png")
        	keyboard.f().onPressDo {self.iniciar()}
        	keyboard.p().onPressDo{game.stop()}
        }
     }
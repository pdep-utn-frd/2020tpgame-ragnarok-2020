import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*
import barraDeVida.*

object juegos{
	const ancho = 25
	const altura = 13
     method iniciar(){
     	game.clear()
     	game.width(ancho)
     	game.height(altura)
     	game.title("conSumo")
     	game.ground("img/celda.png")
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
     	game.addVisual(marcoSuperior)
     	game.addVisual(takeda)
     	game.addVisual(icono)
     	game.addVisual(barraInicial)
     	game.addVisual(sumoMalo)
     	takeda.movimiento()
     	sumoMalo.hastaFinal()
     	
//     	game.onTick(1000,"movimiento",{pescado.movientoy()})
     	game.whenCollideDo(takeda,{elemento=>
     							if (elemento != escenario) {elemento.choque()} 
     							takeda.ganar()
     	})
     	[pescado,sushi,sushi2,carne].forEach({pez=>game.addVisual(pez)
     						pez.moverseSolo()
     	})
     	[pescadoP].forEach({pez=>game.addVisual(pez)
     						pez.moverseSolo()
     	})
     	[pezGlobo, veneno].forEach({unVeneno=>game.addVisual(unVeneno)
     								unVeneno.moverseSolo()
     	})
     	game.ground("img/celda.png")   	
        }
            method gameOver(){
        	game.clear()
        	game.width(ancho)
        	game.height(altura)
        	game.title("ConSumo")
        	game.addVisual(perdiste)
        	game.ground("img/celda.png")
        	keyboard.f().onPressDo {self.iniciar()}
        	keyboard.p().onPressDo{game.stop()}
        }
        
        
     }
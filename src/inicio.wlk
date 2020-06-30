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
     	game.addVisual(marcoSuperior)
     	game.addVisual(takeda)
     	game.addVisual(icono)
     	game.addVisual(barraInicial)
     	game.addVisual(sumoMalo)
     	takeda.movimiento()
     	sumoMalo.hastaFinal()
     	
//     	game.onTick(1000,"movimiento",{pescado.movientoy()})
     	game.whenCollideDo(takeda,{elemento=>elemento.choque() takeda.ganar()})
     	[pescado,sushi,sushi2,carne].forEach({pez=>game.addVisual(pez)  })
     	[pescadoP].forEach({pez=>game.addVisual(pez)})
     	[pezGlobo, veneno].forEach({unVeneno=>game.addVisual(unVeneno) })
     	game.ground("img/celda.png")   	
        }
       
        // pez.moverseSolo()
        //unVeneno.moverseSolo()
        //pez.moverseSolo()
     
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
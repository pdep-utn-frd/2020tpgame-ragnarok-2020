import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*
import barraDeVida.*

object juegos{
	const ancho = 25
	const altura = 12
     method iniciar(){
     	game.clear()
     	game.width(ancho)
     	game.height(altura)
     	game.title("conSumo")
     	game.ground("img/celda.png")
     	game.addVisual(menu)
     	keyboard.enter().onPressDo {self.reglasDeJuego()}
     	}

     	method reglasDeJuego(){
     	game.clear()
     	game.width(ancho)
     	game.height(altura)
     	game.title("conSumo")
     	game.ground("img/celda.png")
     	game.addVisual(cargando)
     	game.onTick(4000,"carga",{self.escenarios()})
     	}

    	 method escenarios(){

     	game.clear()
     	game.width(ancho)
     	game.height(altura)
     	game.title("consumo")
     	[escenario,bordeIzquierdo,bordeDerecho,barraD,barraI,barraInferior,marcoSuperior].forEach({elemento=>game.addVisual(elemento)})
     	game.addVisual(takeda)
     	game.addVisual(icono)
     	game.addVisual(barraInicial)
     	game.addVisual(sumoMalo)
     	takeda.movimiento()
     	sumoMalo.hastaFinal()

     	game.whenCollideDo(takeda,{elemento=>elemento.choque() takeda.ganar()})
     	[pescado,sushi,sushi2,carne,manzana].forEach({elemento=>game.addVisual(elemento) })
     	[arrozP, manzanaP,pezp,pezGlobo,veneno].forEach({pez=>game.addVisual(pez) pez.moverseSolo()})
//     	[pezGlobo, veneno].forEach({unVeneno=>game.addVisual(unVeneno) unVeneno.moverseSolo() })

     }
        

            method gameOver(){

        	game.clear()
        	game.width(ancho)
        	game.height(altura)
        	game.title("ConSumo")
        	game.addVisual(perdiste)
        	game.ground("img/celda.png")
        	keyboard.f().onPressDo {self.iniciar()}
        	keyboard.h().onPressDo{game.stop()}
        }
        
        
     }
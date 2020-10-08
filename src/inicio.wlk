import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*
import barraDeVida.*

object juegos {
	
	const ancho = 25
	const altura = 12
	
    method iniciar() {
    	game.clear()
    	game.width(ancho)
    	game.height(altura)
    	game.title("conSumo")
    	game.ground("img/celda.png")
    	game.addVisual(menu)
    	game.schedule(500,{ => musicaDeMenu.first().play()})
    	keyboard.enter().onPressDo {self.reglasDeJuego() musicaDeMenu.first().stop()}
    }
    
    method reglasDeJuego(){
    	musicaDeIntro.first().play()
    	game.clear()
    	game.width(ancho)
    	game.height(altura)
    	game.title("conSumo")
    	game.ground("img/celda.png")
    	game.addVisual(cargando)
    	game.onTick(4000,"carga",{self.escenarios() musicaDeIntro.first().stop()})
    }
    
    method escenarios() {
    	game.clear()
    	game.width(ancho)
    	game.height(altura)
    	game.title("consumo")
    	[escenario,bordeIzquierdo,bordeDerecho,barraD,barraI,barraInferior,marcoSuperior].forEach({elemento=>game.addVisual(elemento)})
    	takeda.position(game.center())
    	game.addVisual(takeda)
    	game.addVisual(icono)
    	takeda.peso(0)
    	barraInicial.vida(100)
    	game.addVisual(barraInicial)
    	game.addVisual(fuji)
    	game.addVisual(balanza)
    	game.addVisual(kai)
    	game.addVisual(parte1)
    	game.addVisual(parte2)
    	game.addVisual(parte3)
    	takeda.movimiento()
    	fuji.hastaFinal()
    	kai.hastaFinal()
    	game.whenCollideDo(takeda,{elemento=>elemento.choque() takeda.ganar()})
     	[pescado,sushi,sushi2,carne,manzana].forEach({elemento => game.addVisual(elemento) })
     	[arrozP, manzanaP,pezP,pezGlobo,veneno].forEach({elemento => game.addVisual(elemento) elemento.moverseSolo()})
     	pezGlobo.position(game.at(9,2))
     	veneno.position(game.at(6,3))
     	musicaDeCierre.clear()
     	musicaDeCierre.add(game.sound("sonido/musicaFinal.mp3"))

    }
    
    method gameOver() {
    	game.clear()
        game.width(ancho)
        game.height(altura)
        game.title("ConSumo")
        game.addVisual(perdiste)
        game.ground("img/celda.png")
        
        musicaDeCierre.first().play()
    	musicaDeIntro.clear() 
    	musicaDeIntro.add(game.sound("sonido/musicaIntro.mp3"))
    	musicaDeMenu.clear()
    	musicaDeMenu.add(game.sound("sonido/musicaMenu.mp3"))
        
        keyboard.f().onPressDo {self.iniciar() musicaDeCierre.first().stop()}
        keyboard.h().onPressDo{game.stop()}
    }
}
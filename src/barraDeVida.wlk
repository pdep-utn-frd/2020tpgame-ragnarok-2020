import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*

//La vida de Takeda disminuye al comer alimentos podridos

object barraInicial {
	
	var property position = game.at(11,11)
	var  property vida = 100
	
	method image() = "escenarios/barra" + vida + ".png"
	
	method restarVida() {
		vida = vida - 25
	}
}
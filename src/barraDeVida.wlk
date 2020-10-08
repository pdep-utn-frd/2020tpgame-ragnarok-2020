import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*

//La vida de Takeda disminuye al comer alimentos podridos

object barraInicial {
	
	var property position = game.at(7,11)
	var  property vida = 100
	
	method image() = "escenarios/barra" + vida + ".png"
	
	method restarVida() {
		vida = vida - 25
	}
}

class Numeros{
	
	var property position
	
	method image()
}

object parte1 inherits Numeros(position = game.at(19,11)){
	
	
	override method image() = "numeros/" + (takeda.peso() % 10 ).max(0) + ".png"
}

object parte2 inherits Numeros (position = game.at(18,11)){
	
	override method image () = "numeros/" + (if (takeda.peso() >= 100)
		((takeda.peso() - takeda.peso().div(100)*100).div(10))
		else
		(takeda.peso().div(10))
	).max(0) + ".png"
}

object parte3 inherits Numeros(position = game.at(17,11)){
	
	override method image() = "numeros/" + (takeda.peso().div(100)).max(0) + ".png"
}
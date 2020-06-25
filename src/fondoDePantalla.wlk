import wollok.game.*

class Fondos{
	var property image
	var property position = game.origin()
}
  const menu = new Fondos(
  	image="escenarios/menuInicio.png",
  	position=game.at(0,0)
  )
  const  escenario = new Fondos(
  	image="escenarios/mainEscenario.png",
  	position=game.at(5,0)
  )
  const bordeIzquierdo = new Fondos(
  	image="escenarios/borde.png",
  	position=game.at(0,0)
  )
  const bordeDerecho = new Fondos(
  	image="escenarios/borde.png",
  	position=game.at(20,0)
  )
  const perdiste = new Fondos(
  	image = "escenarios/perdiste.png",
  	position = game.at(0,0)
  )
  const ganaste = new Fondos(
  	image = "escenarios/ganaste.png",
  	position = game.at(0,0)
  )
  
  //terminarhoy
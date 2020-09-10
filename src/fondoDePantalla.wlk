import wollok.game.*
import personajes.*

class Fondos{
	var property image
	var property position = game.origin()
	
	method choque() {}
}

const menu = new Fondos(
  	image="escenarios/menuInicio.png",
  	position=game.at(0,0)
  )
  
const  escenario = new Fondos(
  	image="escenarios/mainEscenario.png",
  	position=game.at(5,1)
  )
  
const bordeIzquierdo = new Fondos(
  	image="escenarios/marco.png",
  	position=game.at(0,0)
  )
  
const bordeDerecho = new Fondos(
  	image="escenarios/marco.png",
  	position=game.at(21,0)
  )
  
const perdiste = new Fondos(
  	image = "escenarios/perdiste.png",
  	position = game.at(0,0)
  )
  
const ganaste = new Fondos(
  	image = "escenarios/win.png",
  	position = game.at(0,0)
  )

const marcoSuperior = new Fondos(
  	image = "escenarios/barraSuperior.png",
  	position = game.at(5,11)
  )

const icono = new Fondos(
  	image="img/icono.png",
  	position = game.at(10,11)
  )

const barraD = new Fondos(
  	image="escenarios/barraDer.png",
  	position = game.at(4,0)
  )

const barraI = new Fondos(
 	image = "escenarios/barrader.png",
 	position = game.at(20,0)
 )

const barraInferior = new Fondos(
 	image = "escenarios/barraSuperior.png",
 	position = game.at(5,0)
 )

const cargando = new Fondos(
 	image= "img/carga.png",
 	position=game.origin()
 )
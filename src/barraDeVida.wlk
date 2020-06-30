import wollok.game.*
import fondoDePantalla.*
import personajes.*
import comidas.*
//la barra de vida debe reducirse cada vez que el personajes choca con un alimento podrido

object barraInicial {
	var property image ="escenarios/barra100.png"
	var property position=game.at(7,11)
	var  property vida = 100
	const archivo = "escenarios/barra"
      method actualizar(){
      	game.removeVisual(self)
      	image = archivo + (self.vida()).max(0).toString() +".png"
      	game.addVisual(self)
      }
      method restarVida(){
      	 vida = vida - 25
      }

     }

      
// object acumulacion{
//     var comida = [pescado,sushi,carne,sushi2]
// 	method dibujar(){
// 			
// 			   
// 	}
// }
//  
//falta terminar y areglar      
      
		

	

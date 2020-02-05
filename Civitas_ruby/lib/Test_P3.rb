
require_relative 'civitas_juego.rb'
require_relative 'vista_textual.rb'
require_relative 'controlador.rb'
require_relative 'dado.rb'
require_relative 'jugador.rb'
require_relative 'estados_juego.rb'

module Civitas
  class TestP3
    def initialize

    end
    
    def self.main
      vistatextual = Vista_textual.new
      jugadores = Array.new

      puts "Quieres utilizar tus propios nombres de jugador?"
      respuesta=gets.chomp

      if(respuesta=="si"||respuesta=="Si"||respuesta=="SI")
        puts "Inserta el numero de jugadores que van a jugar: "
        numero=gets.to_i
        puts "Ahora introduce sus nombres: "
        for i in 0...numero
          jugadores.push(gets.chomp)
        end
      else
        jugadores.push("Pepe")
        jugadores.push("Candela")
        jugadores.push("Lucas")
        jugadores.push("Jimena")
      end
      partida = Civitas_juego.new(jugadores)
      
      Dado.instance.attr_set_debug(false)
      
      controlador = Controlador.new(partida,vistatextual)
      controlador.juega
      
    end
    
    end
    
  TestP3.main
end
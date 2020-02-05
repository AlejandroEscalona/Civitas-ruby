# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Civitas
  class Sorpresa_jugadoriracasilla < Sorpresa
    
    def initialize(n,m,t)
      @tablero=n
      @valor = m
      super(t)
    end
    
     def aplicar_a_jugador(actual,todos)
      puts todos[actual]
       if actual>=0&&actual<todos.size
        informe(actual,todos)
        puts "......"
        casilla_actual=todos[actual].num_casilla_actual
        puts "......"
        tirada=@tablero.calcular_tirada(casilla_actual,@valor)
        puts "......"
        nposicion=@tablero.nueva_posicion(casilla_actual,tirada)
        puts "......"
        todos[actual].mover_a_casilla(nposicion)
        puts "......"
        @tablero.attr_get_casilla(nposicion).recibe_jugador(actual,todos)
      end
    end
    
     
  end
end

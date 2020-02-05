# encoding: utf-8
require_relative 'casilla.rb'
require_relative 'casilla_juez.rb'

module Civitas
  class Tablero
    
    attr_reader  :num_casilla_carcel, :casillas
    attr_accessor :tiene_juez
    
    def initialize(n)
      @num_casilla_carcel=1
      if n>1
        @num_casilla_carcel=n
      end
      @casillas=[Casilla.new("Salida")]
      @por_salida=0
      @tiene_juez=false
    end


    def correcto(num_casilla=0)
      operacion=false
      if num_casilla==0
        if @casillas.size>=num_casilla_carcel&&tiene_juez
          operacion=true
        end
      else
        if @casillas.size>=num_casilla_carcel&&tiene_juez&&num_casilla>=0&&num_casilla<casillas.size
          operacion=true
        end
      end              
      return operacion
    end

    def attr_get_carcel                                                #Letras minusculas?
      return @num_casilla_carcel
    end

    def get_por_salida
      if @por_salida>0
        @por_salida-=1
        return @por_salida+1
      end
      return @por_salida                                               #Podemos poner dos return en un mismo método?
    end

    def añade_casilla(casilla)
      if @casillas.size==@num_casilla_carcel
        @casillas.push(Casilla.new("Cárcel"))                          #DUDA NUEVA: Debo poner el constructor de casilla en la llamada en el main o aquí?
      end
      @casillas.push(casilla)
      if @casillas.size==@num_casilla_carcel
        @casillas.push(Casilla.new("Cárcel"))
      end
    end

    def añade_juez
      if !@tiene_juez
        @casillas.push(Casilla_juez.new("Juez", @num_casilla_carcel ) )
        @tiene_juez=true
      end
    end

    def attr_get_casilla(num_casilla)
      if correcto(num_casilla)
        return @casillas[num_casilla]
     end
      return nil
    end

    def nueva_posicion(actual,tirada)
      nactual = -1
      if correcto()
        puts "jj"
        puts actual.class
        puts tirada.class
        puts @casillas.class
        nactual=(actual+tirada)%(@casillas.size)
        puts "ll"
        puts actual.class
        puts tirada.class
        puts @casillas.class
        if nactual!=actual+tirada
          @por_salida+=1
        end
      end
      return nactual
    end

    def calcular_tirada(origen,destino)
      distancia=destino-origen
      if distancia<0
        distancia=distancia+@casillas.size        #DudaNueva: Variable sin el arroba. Al acabar la funcion desaparece la referencia al ser local?
      end
      distancia
    end
  end
end
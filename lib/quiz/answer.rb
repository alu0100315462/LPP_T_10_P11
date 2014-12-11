# -*- coding: utf-8 -*-
module Quiz

  #clase que define una respuesta
  class Answer
    
      #almacena la respuesta, si es correcta o no y su posicione
      def initialize(valor, respuesta)
        @posicion = valor[0]
        @valor = valor[1]
        @respuesta = respuesta
      end
      
      #muestra una respuesta como un string
      def to_s
        @cadena = @posicion.to_s + " -  " + @respuesta.to_s
        return @cadena
      end
    
      #comprueba si la respuesta es correcta
      def consulta
        if  (@valor == 0 ) then
          return true
        end
        return false
      end
  end

end







# -*- coding: utf-8 -*-
module Quiz

  #clase que permite la definicion de una question
  class Question
    
    #almacena la pregunta del examen y un conjunto de respuestas
    #string y hash
    def initialize(pregunta, respuestas)
        @pregunta = pregunta
        @respuestas = Array.new
        respuestas.each do |valor, respuesta|
          a = Answer.new(valor, respuesta)
          @respuestas.push(a)
        end
    end

    #visualiza una question como un stirng
    def to_s
      @cadena = @pregunta + "\n"
      @respuestas.each do |q|
        @cadena = @cadena + "     " + q.to_s + "\n"
      end
        @cadena = @cadena + "\n"
        return @cadena
    end

    #ejecuta una pregunta y espera una repuesta para valorarla
    def consulta
       puts self
       print "Su respuesta: " 
       respuesta = gets.to_i
       return @respuestas[respuesta - 1].consulta
    end
    
    
    def consultaUnica(respuesta)
      return @respuestas[respuesta - 1].consulta
    end
    

  end

end







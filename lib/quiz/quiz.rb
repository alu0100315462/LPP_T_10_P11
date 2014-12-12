# -*- coding: utf-8 -*-

#Modulo para contener las clases con las que se crea un examen
module Quiz
  #clase Quiz que permite la definicion de un examen
  class Quiz
    #Variable que se asigna a una respuesta para indicar que es correcta  
    RIGHT = 0
    #Variable que se asigna a una respuesta para indicar que es erronea 
    WRONG = 1
    
    #almacena el titulo del examen y un bloque que analiza para obtener las preguntas
    #string y bloque
    def initialize(titulo, &preguntas)
      @titulo = titulo
      @preguntas = Array.new
      @counter = 0
      instance_eval &preguntas
    end
    
    #cada cuestion es dividida en pregunta y respuestas, almacenando un array de questiones
    # string y hash
    def question(pregunta, respuestas)
      nuevaPregunta = Question.new(pregunta, respuestas)
      @preguntas.push(nuevaPregunta) 
      @counter = 0
    end
      
    #muestra el examen como un string
    def to_s
      @cadena = @titulo + "\n"
      @preguntas.each do |q|
        @cadena = @cadena + q.to_s
      end
      return @cadena
    end
      
    #diferencia las ocurrencias de las respuestas usando un contador @counter:
    def wrong
      @counter += 1
      [@counter, WRONG]
    end
    
    #diferencia las ocurrencias de las respuestas usando un contador @counter:
    def right
      @counter += 1
      [@counter, RIGHT]
    end
    
    #ejecuta el examen
    def run
      @acertadas = 0
      puts @titulo +"\n\n"
      @preguntas.each do |pre|
        if pre.consulta then
          @acertadas += 1
        end
      end
      puts "#{@acertadas} respuestas correctas de un total de #{@preguntas.size}"
    end
      
      
    def consultaUnica(pregunta, respuesta)
      return @preguntas[pregunta - 1].consultaUnica(respuesta)
    end
      
  end
  
end







# -*- coding: utf-8 -*-
require 'spec_helper'
require './lib/quiz.rb'

describe Quiz::Quiz do
    before :all do
        @quiz = Quiz::Quiz.new("Cuestionario de LPP 05/12/2014") {
            question '¿Cuantos argumentos de tipo bloque puede recibir un metodo?',
                right => '1',
                wrong => '2',
                wrong => 'muchos',
                wrong => 'los que defina el usuario'
                
            question "En Ruby los bloque son objetos que contienen codigo",
                wrong => 'Cierto',
                right => 'Falso'
        }
    end
    
    it "Los cuestionarios deberían tener un método to_s que devuelve una String conteniendo el examen en texto plano" do
      expect(@quiz).to respond_to(:to_s)
    end


    it "Los cuestionarios deberían tener un método run que formulará cada una de las preguntas del cuestionario y mostrara el porcentaje de aciertos" do
      expect(@quiz).to respond_to(:run)
    end
    

    it "Debe tener un método 'wrong' para declarar respuestas erróneas" do
      expect(@quiz).to respond_to(:wrong)
    end


    it "Debe tener un método 'right' para declarar la respuesta correcta" do
      expect(@quiz).to respond_to(:right)
    end


    it "La salida de to_s es correcta" do
      expect(@quiz.to_s).to eq("Cuestionario de LPP 05/12/2014\n¿Cuantos argumentos de tipo bloque puede recibir un metodo?\n     1 -  1\n     2 -  2\n     3 -  muchos\n     4 -  los que defina el usuario\n\nEn Ruby los bloque son objetos que contienen codigo\n     1 -  Cierto\n     2 -  Falso\n\n")
    end
    
    
    
    it "Debe responder a una pregunta" do
      expect(@quiz.consultaUnica(1, 1)).to eq(true)
    end
    
    it "Debe responder a una pregunta" do
      expect(@quiz.consultaUnica(1, 2)).to eq(false)
    end
    
    it "Debe responder a una pregunta" do
      expect(@quiz.consultaUnica(1, 3)).to eq(false)
    end
    
    it "Debe responder a una pregunta" do
      expect(@quiz.consultaUnica(1, 4)).to eq(false)
    end
    
    it "Debe responder a una pregunta" do
      expect(@quiz.consultaUnica(2, 1)).to eq(false)
    end
    
    it "Debe responder a una pregunta" do
      expect(@quiz.consultaUnica(2, 2)).to eq(true)
    end
    
    
    
end

    
  
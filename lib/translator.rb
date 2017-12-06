require "pry"
require_relative "./dictionary"

class Translator

  attr_reader :morse_translate,
              :english_translate

  def initialize
    @dictionary = Dictionary.new
    @morse_translate = []
    @english_translate = []
  end

  def translate_to_morse(input)
    input.downcase.chars.map do |letter|
        @morse_translate << @dictionary.morse[letter]
    end
    @morse_translate.join
  end

  def file_translate(file)
    File.open(file).each do |line|
      line.downcase.chars.map do |letter|
        @morse_translate << @dictionary.morse[letter]
      end
    end
    @morse_translate.join
  end


  def translate_to_english(input)
    input.split.map do |letter|
      @english_translate << @dictionary.english[letter]
    end
    @english_translate.join
  end


end

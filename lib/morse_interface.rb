require "pry"
require_relative "./translator.rb"

class MorseInterface

  def initialize
    @translate = Translator.new
  end

  def start
    puts "Hello! Would you like to translate to (M)orse or to (E)nglish?"
    print ">> "
    go_decision
  end

  def go_decision
    input = gets.chomp.downcase
    if input == "m"
      go_morse
    elsif input == "e"
      go_english
    else
      puts "That was invalid input. Please put (M) for Morse or (E) for English."
      print ">> "
      go_decision
    end
  end

  def go_morse
    puts "Please enter your English words."
    print ">> "
    go_morse_translate
  end

  def go_morse_translate
    input = gets.chomp.downcase
    @translate.translate_to_morse(input)
    puts "#{@translate.morse_translate.join}"
    go_again
  end

  def go_english
    puts "Please enter Morse code. Remember, spaces are represented by the '/' symbol."
    print ">> "
    go_english_translate
  end

  def go_english_translate
    input = gets.chomp
    @translate.translate_to_english(input)
    puts "#{@translate.english_translate.join}"
    go_again
  end

  def go_again
    sleep(2)
    puts "Would you like to input something else? (Y)es or (n)o."
    print ">> "
    go_again_decision
  end

  def go_again_decision
    input = gets.chomp.downcase
    if input == "y"
      start
    elsif input == "n"
      puts "Goodbye!"
    else
      puts "That was invalid input. Please put (y) for yes or (n) for no."
      print ">> "
      go_again_decision
    end
  end


end

require "minitest/autorun"
require "minitest/pride"
require "pry"
require_relative "../lib/translator"

class TranslatorTest < Minitest::Test

 def test_it_exists
   translator = Translator.new

   assert_instance_of Translator, translator
 end

 def test_it_translates_english_to_morse
   translator = Translator.new

   morse = translator.translate_to_morse("MATT DAMON")

   assert_equal "--.--- -...-------." , morse
 end

 def test_it_translates_from_file_to_morse
   translator = Translator.new

   file = translator.file_translate("./lib/input.txt")

   assert_equal ".. .--- ..-. .- ..-....-...", file
 end

 def test_it_translates_morse_to_english
   translator = Translator.new

   english = translator.translate_to_english(".... . .-.. .-.. --- / .-- --- .-. .-.. -..")

   assert_equal "hello world", english
 end
end

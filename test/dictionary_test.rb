require "minitest/autorun"
require "minitest/pride"
require "pry"
require_relative "../lib/dictionary"

class DictionaryTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new

    assert_instance_of Dictionary, dictionary
  end

  def test_it_pulls_morse_values
    dictionary = Dictionary.new

    morse = dictionary.morse["a"]

    assert_equal ".-", morse

    morse = dictionary.morse["s"]

    assert_equal "...", morse
  end

  def test_it_pulls_english_values
    dictionary = Dictionary.new

    english = dictionary.english[".-"]

    assert_equal "a", english

    english = dictionary.english["..."]

    assert_equal "s", english
  end
end

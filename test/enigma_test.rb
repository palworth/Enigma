require_relative '../test_helper'
require './lib/enigma'
require './lib/shift'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_encrypts_message
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_isolate_messages
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
    assert_equal expected, @enigma.msg_isolator("hello world")
  end

  def test_it_can_return_character_converter
    expected = ["k", "e", "d", "e"]
    assert_equal expected, @enigma.character_converter((["h", "e", "l", "l"]), ([3, 27, 73, 20]))
  end

  def test_it_can_return_message_from_msg_fuser
    assert_equal "keder ohulw", @enigma.msg_fuser([["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]])
  end

  def test_it_can_return_array_of_encrypted_msg_from_msg_converter
    expected = [["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]]
    assert_equal expected, @enigma.msg_converter("hello world", "02715", "040895")
  end

end

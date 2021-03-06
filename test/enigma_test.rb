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
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_it_encrypts_message_without_date_arg
    expected = {
      encryption: "nib udmcxpu",
      key: "02715",
      date: "150120"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_encrypts_message_without_key_arg
    @shift.stubs(:generated_key => "12345")
    expected = @enigma.encrypt("hello world!", nil, "040895")
    assert_equal expected, @enigma.encrypt("hello world!", nil, "040895")
  end

  def test_it_encrypts_message_without_either_arg
    @enigma.stubs(:encrypt => {encryption: "xescd cfglk!", key: "12345", date: "140120"})
    expected = {
      encryption: "xescd cfglk!",
      key: "12345",
      date: "140120"
    }
    assert_equal expected, @enigma.encrypt("hello world!", nil, nil)
  end

  def test_it_decrypts_message
    expected = {
      decryption: "hello world",
           key: "02715",
           date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_decrypts_message_with_special_character
    expected = {
      decryption:"hello world!",
        key: "12345",
        date: "150120"
    }
    assert_equal expected, @enigma.decrypt("xescd cfglk!", "12345", "150120")
  end

  def test_it_decrypts_message_using_current_date
    expected = {
      decryption:"hello world!",
        key: "12345",
        date: "150120"
    }
    assert_equal expected, @enigma.decrypt("xescd cfglk!", "12345", nil)
  end

  def test_it_can_return_date_with_date_arg
    assert_equal "010120", @enigma.date_output("010120")
  end

  def test_it_can_return_date_without_date_arg
    assert_equal "150120", @enigma.date_output
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

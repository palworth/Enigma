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

  def test_it_returns_date
    assert_equal 11120, @enigma.date_today
  end

  def test_it_encrypts_message
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "12715", "040895")
  end

  def test_it_can_isolate_messages
    assert_equal [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]], @enigma.msg_isolator("hello world")
  end

end

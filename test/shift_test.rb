require_relative '../test_helper'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    @shift = Shift.new
  end
  def test_it_exists
    assert_instance_of Shift, @shift 
  end
end

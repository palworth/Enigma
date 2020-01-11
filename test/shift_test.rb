require_relative '../test_helper'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test
  def setup
    # @enigma = Enigma.new
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_returns_final_offset_split_array
    assert_equal [1, 2, 3, 6, 5, 4, 4, 0, 0], @shift.final_offset_split
  end

  def test_final_offset_split_array_changes_with_argument
    assert_equal [1, 6, 9, 5, 7, 2, 4, 8, 4, 0, 0], @shift.final_offset_split(130220)
  end

end

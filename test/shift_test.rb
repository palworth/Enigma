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

  def test_it_returns_date
    assert_equal 120120, @shift.date_today
  end

  def test_it_returns_final_offset_split_array
    assert_equal [1, 4, 4, 2, 8, 8, 1, 4, 4, 0, 0], @shift.final_offset_split
  end

  def test_final_offset_split_array_changes_with_argument
    assert_equal [1, 6, 9, 5, 7, 2, 4, 8, 4, 0, 0], @shift.final_offset_split("130220")
  end

  def test_it_calculates_offset_hash_with_set_date
    expected = {:a=>4, :b=>4, :c=>0, :d=>0}
    assert_equal expected, @shift.offset
  end

  def test_it_calculates_offset_hash
    expected = {:a=>4, :b=>4, :c=>0, :d=>0}
    assert_equal expected, @shift.offset("010120")
  end

  def test_it_returns_generated_key
    assert_equal "12345", @shift.generated_key
  end

  def test_it_returns_key_split
    assert_equal [1, 2, 3, 4, 5], @shift.key_split
  end

  def test_it_returns_key_split_with_argument
    assert_equal [0, 2, 5, 4, 3], @shift.key_split("02543")
  end

  def test_it_returns_key
    expected = {:a=>02, :b=>23, :c=>34, :d=>45}
    assert_equal expected, @shift.key("02345")
  end


  def test_it_returns_shift_hash
    expected = {:a=>16, :b=>27, :c=>34, :d=>45}
    assert_equal expected, @shift.shift("12345", "110120")
  end

end

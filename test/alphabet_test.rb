require_relative '../test_helper'
require './lib/alphabet'
require 'date'

class AlphabetTest < Minitest::Test
  def setup
    @alphabet = Alphabet.new
  end

end 

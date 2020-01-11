class Enigma
  attr_reader :date, :date_today

  def initialize
    @date = date
    @date_today = Time.now.strftime("%m/%d/%y").gsub("/", "").to_i
  end

  def encrypt(message, key, date)
    require "pry"; binding.pry
  end

end

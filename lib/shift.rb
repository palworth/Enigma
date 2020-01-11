class Shift
  attr_reader :date_today
  def initialize
    @date_today = Time.now.strftime("%m/%d/%y").gsub("/", "").to_i
  end

  # def shift(key = nil, date = nil)
   # code_key = @cipherkey.seperate_to_pairs(key)
   # offset_amt = @offset.offset(date)
   # KEY + OFFSET = SHIFT
   # code_key.merge(offset_amt) { |placement, old, new| old + new }.values
 # end

  def offset(date = nil)
    {
      a: final_offset_split(date)[-4],
      b: final_offset_split(date)[-3],
      c: final_offset_split(date)[-2],
      d: final_offset_split(date)[-1]
    }

  end

  def final_offset_split(date = nil)
    # require "pry"; binding.pry

    if date == nil
       @date_today**2
    else
      # require "pry"; binding.pry
      date.to_i**2
    end.to_s.split(//).map{|number| number.to_i}
  end


end

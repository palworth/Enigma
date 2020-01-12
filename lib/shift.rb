class Shift
  attr_reader :date_today, :generated_key
  def initialize
    @date_today = Time.now.strftime("%d/%m/%y").gsub("/", "").to_i
    @generated_key = "12345"
  end

  def shift(key = nil, date = nil)
    {
       a: key(key)[:a] + offset(date)[:a],
       b: key(key)[:b] + offset(date)[:b],
       c: key(key)[:c] + offset(date)[:c],
       d: key(key)[:d] + offset(date)[:d],
    }
 end

  def offset(date = nil)
    {
      a: final_offset_split(date)[-4],
      b: final_offset_split(date)[-3],
      c: final_offset_split(date)[-2],
      d: final_offset_split(date)[-1]
    }
  end

  def final_offset_split(date = nil)
    if date == nil
       @date_today**2
    else
      date.to_i**2
    end.to_s.split(//).map{|number| number.to_i}
  end

  def key(key = nil)
    divided_key = []
    key_split(key).each_cons(2) do |numbers|
      divided_key << numbers.join.to_i
    end
    {
      a: divided_key[0],
      b: divided_key[1],
      c: divided_key[2],
      d: divided_key[3]
    }
  end

  def key_split(key = nil)
    if key == nil
       @generated_key
    else
      @generated_key = key
    end.to_s.split(//).map{|number| number.to_i}
  end
end

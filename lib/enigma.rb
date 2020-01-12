# require './shift'

class Enigma
  attr_reader :date, :date_today, :character_list

  def initialize
    @date = date
    @date_today = Time.now.strftime("%m/%d/%y").gsub("/", "").to_i
    @shift_infomation = Shift.new
    @character_list = ("a".."z").to_a << " "
  end

  def encrypt(message, key = nil, date = nil)
    # require "pry"; binding.pry
    {
      encryption: msg_fuser(msg_converter(message, key, date)) ,
      key: key,
      date: date
    }
  end

  def msg_converter(message, key = nil, date = nil)
    shift_parameters = @shift_infomation.shift(key, date)
    message_in_groups = msg_isolator(message)
    message_in_groups.map.with_index do |message_increment, index|
      character_converter(message_increment, shift_parameters.values)
    end
  end

  def msg_isolator(message)
    message_increments = []
    msg_to_convert = message.downcase.chars
    msg_to_convert.each_slice(4) do |msg_seperate|
      message_increments <<  msg_seperate
    end
    message_increments
  end

  def msg_fuser(split_message)
    split_message.flatten.join
  end

  def character_converter(message_increment, shift_parameters)
    message_increment.map.with_index do |character, index|
      if @character_list.include?(character)
          rotated_list = @character_list.rotate(shift_parameters[index])
          og_character_index = @character_list.index(character)
          character = rotated_list[og_character_index]
      else
        character
      end
    end
  end



end

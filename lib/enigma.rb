# require './shift'

class Enigma
  attr_reader :date, :character_list, :shift_infomation

  def initialize
    @date = date
    @shift_infomation = Shift.new
    @character_list = ("a".."z").to_a << " "
  end

  def encrypt(message, key = nil, date = nil)
    {
      encryption: msg_fuser(msg_converter(message, key, date)) ,
      key: key_output(key),
      date: date_output(date)
    }
  end

  def decrypt(message, key = nil, date = nil)
    {
      decryption: msg_fuser(msg_converter_decrypt(message, key, date)) ,
      key: key_output(key),
      date: date_output(date)
    }
  end

  def date_output(date = nil)
    output = if date == nil
      @shift_infomation.date_today
    else
      date
    end
    output
  end

  def key_output(key = nil)
    output = if key == nil
      @shift_infomation.generated_key
    else
      key
    end
    output
  end

  def msg_converter(message, key = nil, date = nil)
    shift_parameters = @shift_infomation.shift(key, date)
    message_in_groups = msg_isolator(message)
    message_in_groups.map.with_index do |message_increment, index|
      character_converter(message_increment, shift_parameters.values)
    end
  end

  def msg_converter_decrypt(message, key = nil, date = nil)
    shift_parameters = @shift_infomation.shift(key, date)
    message_in_groups = msg_isolator(message)
    message_in_groups.map.with_index do |message_increment, index|
      character_converter_decrypt(message_increment, shift_parameters.values)
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

  def character_converter_decrypt(message_increment, shift_parameters)
    message_increment.map.with_index do |character, index|
      if @character_list.include?(character)
          rotated_list = @character_list.rotate(-(shift_parameters[index]))
          og_character_index = @character_list.index(character)
          character = rotated_list[og_character_index]
      else
        character
      end
    end
  end

end

require_relative 'key_offset.rb'
require_relative 'date_offset.rb'

class Shifter

  def initialize(shiftable_characters, key = nil, date = nil)
    @shiftable_characters = shiftable_characters
    @key = KeyOffset.new(key)
    @date = DateOffset.new(date)

    @encrypt = true
  end

  def shift(char, offset)
    return char unless @shiftable_characters.include?(char)

    character_index = @shiftable_characters.index(char)
    to_shift = amount_to_shift(offset)

    @shiftable_characters.rotate(to_shift)[character_index]
  end

  def key_used
    @key.value
  end

  def date_used
    @date.date
  end

  def encrypt!
    @encrypt = true
  end

  def decrypt!
    @encrypt = false
  end

  private

  def amount_to_shift(offset)
    to_shift = @key.send(offset).to_i + @date.send(offset).to_i

    if encrypt?
      to_shift
    else
      to_shift * -1
    end
  end

  def encrypt?
    @encrypt
  end

end



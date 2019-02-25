require_relative 'shifter.rb'
require_relative 'code_breaker.rb'

class Cipher

  def initialize(phrase, key = nil, date = nil)
    @phrase = phrase

    @shifter = Shifter.new(characters_to_shift, key, date)
  end

  def encrypt
    @shifter.encrypt!

    {
      encryption: shift_phrase,
      key: @shifter.key_used,
      date: @shifter.date_used
    }
  end

  def decrypt
    @shifter.decrypt!

    {
      decryption: shift_phrase,
      key: @shifter.key_used,
      date: @shifter.date_used
    }
  end

  private

  def shift_phrase
    converted_phrase = ""

    split_phrase.each_with_index do |char, index|
      offset = find_offset(index)
      converted_phrase << @shifter.shift(char, offset)
    end

    converted_phrase
  end

  def split_phrase
    @phrase.split('')
  end

  def find_offset(index)
    # modulo by 4 to keep index below four and avoid weirdness with divisible by 3s and 2s
    normalized_index = ((index % 4) + 1)

    index_to_offset[normalized_index]
  end

  def index_to_offset
    {
      1 => :a,
      2 => :b,
      3 => :c,
      4 => :d
    }
  end

  def characters_to_shift
    ("a".."z").to_a << " "
  end

end

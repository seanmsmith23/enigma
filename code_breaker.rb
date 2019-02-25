require_relative 'cipher.rb'

class CodeBreaker

  def initialize(phrase, date=nil)
    @phrase = phrase
    @date = date
  end

  def crack
    possible_keys.each do |key|
      cipher = Cipher.new(@phrase, key, @date)
      return cipher.decrypt if decryption_succeeded?(cipher)
    end
  end

  private

  def possible_keys
    ("0".."99999")
  end

  def decryption_succeeded?(cipher)
    last_four_of_decryption(cipher) == " end"
  end

  def last_four_of_decryption(cipher)
    cipher.decrypt[:decryption][-4..-1]
  end

end

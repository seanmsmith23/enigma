require_relative 'cipher.rb'

class CodeBreaker

  def initialize(phrase, date=nil)
    @phrase = phrase
    @date = date
  end

  def crack
    possible_keys.each do |key|
      decrypted = Cipher.new(@phrase, key, @date).decrypt
      return decrypted if decryption_succeeded?(decrypted)
    end
  end

  private

  def possible_keys
    ("0".."99999")
  end

  def decryption_succeeded?(decrypted)
    last_four_of_decryption(decrypted) == " end"
  end

  def last_four_of_decryption(decrypted)
    decrypted[:decryption][-4..-1]
  end

end

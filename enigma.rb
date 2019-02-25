require_relative 'cipher.rb'

class Enigma

  def initialize ; end

  def encrypt(phrase, key = nil, date = nil)
    cipher = Cipher.new(phrase, key, date)
    cipher.encrypt
  end

  def decrypt(phrase, key = nil, date = nil)
    cipher = Cipher.new(phrase, key, date)
    cipher.decrypt
  end

  def crack(phrase, date = nil)
    code_breaker = CodeBreaker.new(phrase, date)
    code_breaker.crack
  end

end

enigma = Enigma.new

p "VALIDATING ENCRYPTION"
p enigma.encrypt("hello world!", "02715", "040895")

p "VALIDATING DECRYPTION"
p enigma.decrypt("keder ohulw!", "02715", "040895")

p "ENCRYPTING NO DATE/KEY"
result = enigma.encrypt("hello world!")
p result

p "DECRYPT NO DATE/KEY TO VALIDATE"
p enigma.decrypt(result[:encryption], result[:key], result[:date])

p "ENCRYPTING TO CHECK CRACKING"
encrypted = enigma.encrypt("hello world end", "08304", Date.today.strftime("%m%d%y"))
p encrypted

p "CRACKING THE KEY"
p enigma.crack(encrypted[:encryption], encrypted[:date])

p "CANT CRACK THE KEY WITHOUT THE DATE - ONLY WORKS FOR TODAY"
p enigma.crack(encrypted[:encryption])




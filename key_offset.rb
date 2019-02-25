class KeyOffset

  def initialize(key = nil)
    @key = generate_key(key)
  end

  def a
    @key[0..1]
  end

  def b
    @key[1..2]
  end

  def c
    @key[2..3]
  end

  def d
    @key[3..4]
  end

  def value
    @key
  end

  private

  def generate_key(key = nil)
    key = create_random_key if key.nil?

    if less_than_five_chars?(key)
      pad_with_zeroes(key)
    else
      key
    end
  end

  def create_random_key
    rand(1..99999).to_s
  end

  def less_than_five_chars?(key)
    key.length < 5
  end

  def pad_with_zeroes(key)
    "%05d" % key
  end

end

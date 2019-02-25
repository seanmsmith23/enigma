class DateOffset

  attr_reader :date

  def initialize(date)
    @date = date ? date : Date.today.strftime("%m%d%y")
    @offset = create_offset
  end

  def a
    @offset[0]
  end

  def b
    @offset[1]
  end

  def c
    @offset[2]
  end

  def d
    @offset[3]
  end

  private

  def create_offset
    squared_date = @date.to_i * @date.to_i
    squared_date.to_s[-4..-1]
  end

end

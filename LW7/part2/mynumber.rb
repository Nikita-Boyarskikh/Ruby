# Custom Number class
class MyNumber
  attr_reader :num

  def initialize(num)
    @num = Integer(num)
  end

  def inspect
    @num.inspect
  end

  def to_s
    @num.to_s
  end

  def print
    puts @num
  end

  def num_of_digits
    num = @num > 0 ? @num : -@num
    num.to_s.length
  end
end

require_relative 'mynumber'

# Class with 2 fields: @num and @str
class NumberString < MyNumber
  attr_reader :num, :str

  def initialize(num, str)
    super(num)
    @str = String(str)
  end

  def inspect
    "{\"num\":#{@num},\"str\":\"#{@str}\"}"
  end

  alias_method :to_s, :inspect

  def print
    puts inspect
  end

  def str_len
    @str.length
  end
end

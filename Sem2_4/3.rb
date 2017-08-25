#!/usr/bin/ruby

# Expand standart class Array
class Array
  def my_reduce(initial = nil, block = nil)
    unless block
      block = initial
      initial = nil
    end

    result = initial || 0

    if block.is_a? Symbol
      symbol = block
      block = ->(aggr, item) { aggr.send(symbol, item) }
    end

    each do |item|
      result = (block_given? ? yield(result, item) : block.call(result, item))
    end

    return result
  end
end

p (1..10).to_a.my_reduce { |result, item| result + item }
p (1..10).to_a.my_reduce(:+)
p (1..10).to_a.my_reduce(->(result, item) { result + item })

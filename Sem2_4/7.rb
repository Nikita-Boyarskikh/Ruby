#!/usr/bin/ruby
def procedure_map(array, method)
  result = []

  array.each do |item|
    result.push method.call(item)
  end

  result
end

def procedure_reduce(array, method, initial = 0)
  result = initial

  array.each do |item|
    result = method.call(result, item)
  end

  result
end

array = [1, 34, 5, 3, 4, 6]

p array.map { |item| item**2 }
p procedure_map(array, proc { |item| item**2 })
p array.reduce { |result, item| result + item**2 }
p procedure_reduce(array, proc { |result, item| result + item**2 })

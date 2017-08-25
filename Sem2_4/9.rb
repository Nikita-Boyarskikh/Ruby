#!/usr/bin/ruby
result1 = []

(1..3).each do |x|
  result1 << x if x.odd?
end

result2 = 0
result1.each do |x|
  result2 = result2.send(:+, x)
end

p result2

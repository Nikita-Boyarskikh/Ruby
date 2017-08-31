# Number of segments of the split
N = 30_000

def my_trap(a, b, block = nil)
  if block_given?
    foo_a = yield a
    foo_b = yield b
  else
    foo_a = block.call(a)
    foo_b = block.call(b)
  end

  result = (foo_a + foo_b) / 2
  delta = (b - a) / N
  x = a + delta

  N.times do
    result += block_given? ? yield(x) : block.call(x)
    x += delta
  end
  result *= delta

  result
end

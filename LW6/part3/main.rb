# Number of segments of the split
N = 30_000

def my_trap(a, b, block = nil)
  foo_a = yield a
  foo_b = yield b

  result = (foo_a + foo_b) / 2
  delta = (b - a) / N
  x = a + delta

  N.times do
    result += yield(x)
    x += delta
  end
  result *= delta

  result
end

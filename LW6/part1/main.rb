require 'mathn'

def calc_iterations(e)
  y = 0
  x = 2
  n = 0

  while (x / 2 - y).abs > e
    n += 1
    y += (-1)**(n - 1) * Math.sin(n * x) / n
  end

  return n
end

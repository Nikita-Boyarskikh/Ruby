require 'mathn'

def half_x_sumrow(x)
  n = 0

  loop do
    n += 1
    yield (-1)**(n - 1) * Math.sin(n * x) / n
  end
end

def calc_iterations(e)
  y = 0
  x = 2
  n = 0

  half_x_sumrow(x) do |delta|
    y += delta
    n += 1

    return n if (x / 2 - y).abs < e
  end
end

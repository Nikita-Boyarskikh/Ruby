require 'mathn'

def calc_iterations(e)
  y = 0
  x = 2
  n = 0

  half_x_sumrow = Enumerator.new do |yielder|
    loop do
      n += 1
      yielder << (-1)**(n - 1) * Math.sin(n * x) / n
    end
  end

  half_x_sumrow.take_while do |delta|
    y += delta
    (x / 2.0 - y).abs >= e
  end
  n
end

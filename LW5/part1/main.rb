require 'mathn'

def calc(x, y, z)
  (3 + Math.exp(y).to_r - 1) /
    (1 + x.to_r**2 * (y.to_r - Math.tan(z.to_r)).abs).to_f
end

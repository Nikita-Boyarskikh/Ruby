#!/usr/bin/ruby

require 'mathn'

require_relative 'main'

def main
  lam1 = ->(x) { x + Math.cos(x) }
  result = my_trap(-1, 4, &lam1)
  puts "Результат вычисления определённого интеграла от -1 до 4 от функции x + cos(x) : #{result}"

  lam2 = ->(x) { Math.tan(x + 1) / (x + 1) }
  result = my_trap(1, 2, &lam2)
  puts "Результат вычисления определённого интеграла от 1 до 2 от функции tg(x + 1) / (x + 1) : #{result}"
end

main if $PROGRAM_NAME == __FILE__

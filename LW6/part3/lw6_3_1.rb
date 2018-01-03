#!/usr/bin/env ruby

require 'mathn'

require_relative 'main'

def main
  result = my_trap(-1, 4) { |x| x + Math.cos(x) }
  puts "Результат вычисления определённого интеграла от -1 до 4 от функции x + cos(x) : #{result}"
  result = my_trap(1, 2) { |x| Math.tan(x + 1) / (x + 1) }
  puts "Результат вычисления определённого интеграла от 1 до 2 от функции tg(x + 1) / (x + 1) : #{result}"
end

main if $PROGRAM_NAME == __FILE__

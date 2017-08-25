#!/usr/bin/ruby
# coding: utf-8

require_relative 'main.rb'

def main
  puts 'Количество итераций с точностью до 10^-3: ' + calc_iterations(10**-3).to_s
  puts 'Количество итераций с точностью до 10^-4: ' + calc_iterations(10**-4).to_s
end

main if $PROGRAM_NAME == __FILE__

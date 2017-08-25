#!/usr/bin/ruby
# coding: utf-8

require_relative 'main'

def main
  print 'Введите x: '
  x = gets.to_r
  print 'Введите y: '
  y = gets.to_r
  print 'Введите z: '
  z = gets.to_r

  a = calc(x, y, z)
  puts a
end

main if $PROGRAM_NAME == __FILE__

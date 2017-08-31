#!/usr/bin/ruby
# coding: utf-8

require_relative 'mynumber'
require_relative 'number_string'

def main
  print "Введите число для инициализации объекта MyNumber: "
  n = gets.chomp

  # Demonstrate MyNumber power
  puts "Создание объекта..."
  begin
    num = MyNumber.new(n)
  rescue ArgumentError => e
    puts "Поддерживаются только целые числа"
    exit(1)
  end

  print "Вывод с помощью метода #print: "
  num.print
  print "Вывод с помощью метода #p: "
  p num
  print "Вывод с помощью метода #puts: "
  puts num
  print "Количество цифр в числе: "
  puts num.num_of_digits
  puts

  print "Введите число для инициализации объекта NumberString: "
  num = gets.chomp
  print "Введите строку для инициализации объекта NumberString: "
  str = gets.chomp

  # Demonstrate NumberString power
  puts "Создание объекта..."
  begin
    numstr = NumberString.new(num, str)
  rescue ArgumentError => e
    puts "Поддерживаются только целые числа"
    exit(1)
  end

  print "Вывод с помощью метода #print: "
  numstr.print
  print "Вывод с помощью метода #p: "
  p numstr
  print "Вывод с помощью метода #puts: "
  puts numstr
  print "Количество цифр в числе: "
  puts numstr.num_of_digits
  print "Количество символов в строке: "
  puts numstr.str_len
end

main if $PROGRAM_NAME == __FILE__

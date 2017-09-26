#!/usr/bin/ruby

require_relative 'main'

def main
  print 'Введите слово для замены: '
  word = gets.chomp.split[0]

  result = []

  puts 'Введите строки для корректировки:'
  while str = gets
    words = str.chomp.split
    corrected = correct(words, word)
    result.push corrected.join ' '
  end

  puts
  puts 'Скорректированные строки:'
  puts result.join "\n"
end

main if $PROGRAM_NAME == __FILE__

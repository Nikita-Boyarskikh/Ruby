#!/usr/bin/ruby
# coding: utf-8

require_relative 'main'

def main
  print 'Введите название входного файла: '
  f = gets
  throw EOFError, 'Unexpected end of file' unless f

  print 'Введите название выходного файла (для группировки по 5 чисел одного знака): '
  p5 = gets
  throw EOFError, 'Unexpected end of file' unless p5

  print 'Введите название выходного файла (для группировки по 20 чисел одного знака): '
  p20 = gets
  throw EOFError, 'Unexpected end of file' unless p20

  fr5 = FileRewriter.new(f.chomp, p5.chomp, 5)
  fr20 = FileRewriter.new(f.chomp, p20.chomp, 20)

  # generate input file
  fr5.generate_file

  # rewtite input file into output files
  fr5.rewrite_file
  fr20.rewrite_file
end

main if $PROGRAM_NAME == __FILE__

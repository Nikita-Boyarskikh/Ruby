#!/usr/bin/ruby
# coding: utf-8

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'mynumber'

class MyNumberTest < Minitest::Test
  def test_inspect
    num = MyNumber.new(233254)
    assert_equal num.inspect, '233254', 'inspect is ok'
  end

  def test_to_s
    num = MyNumber.new(234)
    assert_equal num.to_s, '234', 'to_s is ok'
  end

  def test_print
    origin_stdout = $stdout
    $stdout = StringIO.new
    num = MyNumber.new(342)
    num.print
    assert_equal $stdout.string, "342\n", 'print is ok'
    $stdout = origin_stdout
  end

  def test_num_of_digits
    num = MyNumber.new(3523532)
    assert_equal num.num_of_digits, 7, 'num_of_digits(3523532) == 7'
    num = MyNumber.new(2)
    assert_equal num.num_of_digits, 1, 'num_of_digits(2) == 1'
    num = MyNumber.new(-235)
    assert_equal num.num_of_digits, 3, 'num_of_digits(-235) == 3'
    num = MyNumber.new(-1)
    assert_equal num.num_of_digits, 1, 'num_of_digits(-1) == 1'
  end
end

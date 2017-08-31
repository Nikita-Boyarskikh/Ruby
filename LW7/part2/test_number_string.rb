#!/usr/bin/ruby
# coding: utf-8

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'number_string'

# Testing NumberString class methods
class NumberStringTest < Minitest::Test
  def test_inspect
    num = NumberString.new(233_254, 'blablabla')
    assert_equal num.inspect,
                 '{"num":233254,"str":"blablabla"}',
                 'inspect is ok'
  end

  def test_to_s
    num = NumberString.new(234, 'string')
    assert_equal num.to_s,
                 '{"num":234,"str":"string"}',
                 'to_s is ok'
  end

  def test_print
    origin_stdout = $stdout
    $stdout = StringIO.new
    num = NumberString.new(342, 'Hello, World!')
    num.print
    assert_equal $stdout.string,
                 "{\"num\":342,\"str\":\"Hello, World!\"}\n",
                 'print is ok'
    $stdout = origin_stdout
  end

  def test_str_len
    num = NumberString.new(1, '')
    assert_equal num.str_len, 0, 'str_len("") == 0'
    num = NumberString.new(1, '3')
    assert_equal num.str_len, 1, 'str_len("3") == 1'
    num = NumberString.new(1, 'f;jete2ef')
    assert_equal num.str_len, 9, 'str_len("f;jete2ef") == 9'
    num = NumberString.new(1, 'Привет, мир!')
    assert_equal num.str_len, 12, 'Cyrilic string length is ok'
  end
end

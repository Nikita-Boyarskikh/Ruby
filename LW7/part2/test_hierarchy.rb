#!/usr/bin/ruby
# coding: utf-8


require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'mynumber'
require_relative 'number_string'

class Hierarchy < Minitest::Test
  def test_hierarchy
    assert_includes NumberString.ancestors, MyNumber,
      'NumberString class is a descendant of the MyNumber class'
  end
end

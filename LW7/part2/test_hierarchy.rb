#!/usr/bin/ruby

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'mynumber'
require_relative 'number_string'

# Test right hierarchy of classes
class Hierarchy < Minitest::Test
  def test_hierarchy
    assert_includes NumberString.ancestors, MyNumber,
                    'NumberString class is a descendant of the MyNumber class'
  end
end

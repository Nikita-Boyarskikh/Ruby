#!/usr/bin/env ruby

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'mynumber'
require_relative 'number_string'

# Test right hierarchy of classes
class Hierarchy < Minitest::Test
  def test_hierarchy
    mn = MyNumber.new(1)
    ns = NumberString.new(1, 'one')
    assert_includes ns.class.ancestors, mn.class,
                    'NumberString class is a descendant of the MyNumber class'
  end
end

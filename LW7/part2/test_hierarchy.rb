#!/usr/bin/ruby

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'mynumber'
require_relative 'number_string'

# Test right hierarchy of classes
class Hierarchy < Minitest::Test
  def test_hierarchy
    ns = NumberString.new
    mn = MyClass.new
    assert_includes ns.class.ancestors, mn.class,
                    'NumberString class is a descendant of the MyNumber class'
  end
end

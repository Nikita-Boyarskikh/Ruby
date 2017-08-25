#!/usr/bin/ruby
# coding: utf-8

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'mathn'

require_relative 'main'

# Main test case
class MainTestCase < Minitest::Test
  def test_calc
    assert_equal(calc(1, 2, 3), 2.9877222087999886, '1,2,3')
    assert_equal(calc(0, 0, 0), 3.0, '0,0,0')
    assert_equal(calc(1, 0, Math::PI / 4), 1.5, '1,0,PI/4')
  end
end

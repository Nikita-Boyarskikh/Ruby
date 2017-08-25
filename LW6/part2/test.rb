#!/usr/bin/ruby
# coding: utf-8

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'main'

# Main test case
class MainTestCase < Minitest::Test
  def test_calc_iterations
    assert(calc_iterations(10**-4) > calc_iterations(10**-3),
           'Iterations with small delta more then iterations with large delta')
  end
end

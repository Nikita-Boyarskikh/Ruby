#!/usr/bin/ruby

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'mathn'

require_relative 'main'

# Main test case
class MainTestCase < Minitest::Test
  DELTA = 10**-3

  def test_x_plus_cosx__lambda
    result = my_trap(-1, 4, &->(x) { x + Math.cos(x) })
    expect = 15 / 2 + Math.sin(1) + Math.sin(4)
    assert_in_delta(
      result, expect, DELTA,
      'Int( x + cos(x) ) from -1 to 4 = 75 (with lambda expression)'
    )
  end

  def test_x_plus_cosx__block
    result = my_trap(-1, 4) { |x| x + Math.cos(x) }
    expect = 15 / 2 + Math.sin(1) + Math.sin(4)
    assert_in_delta(
      result, expect, DELTA,
      'Int( x + cos(x) ) from -1 to 4 = 75 (with given block)'
    )
  end

  def test__tgx_plus_1__devided_by__x_plus_1__lambda
    result = my_trap(1, 2, &->(x) { Math.tan(x + 1) / (x + 1) })
    expect = -0.376871
    assert_in_delta(
      result, expect, DELTA,
      'Int( tg(x + 1) / (x + 1) ) from 1 to 2 = 80 (with lambda expression)'
    )
  end

  def test__tgx_plus_1__devided_by__x_plus_1__block
    result = my_trap(1, 2) { |x| Math.tan(x + 1) / (x + 1) }
    expect = -0.376871
    assert_in_delta(
      result, expect, DELTA,
      'Int( tg(x + 1) / (x + 1) ) from 1 to 2 = 80 (with given block)'
    )
  end
end

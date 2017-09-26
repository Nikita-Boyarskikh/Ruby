#!/usr/bin/ruby

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'main'

# Main test case
class MainTestCase < Minitest::Test
  def test_correct
    assert_equal(
      correct(%w[летать _ луна _ ледяной], 'corrected'),
      %w[_] * 2,
      'All even words, started with "л", deleted'
    )

    assert_equal(
      correct(%w[летать носок луна новый ледяной нести], 'corrected'),
      %w[corrected] * 3,
      'All odd words, started with "н", corrected with given word'
    )

    assert_equal(
      correct(%w[blabla _ lollol _ 12345], 'corrrected'),
      %w[blabla _ lollol _ 12345],
      'All even words, started with no "л", not deleted'
    )

    assert_equal(
      correct(%w[льдышка нить] * 100, 'other'),
      %w[other] * 100,
      'Number of words not importantly'
    )
  end
end

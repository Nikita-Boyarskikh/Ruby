#!/usr/bin/ruby
# coding: utf-8

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'main'
require 'tempfile'

# Main test case
class MainTestCase < Minitest::Test
  def test_generate_file
    errors = []

    10.times do |i|
      temp_file_in = Tempfile.new('in' + i.to_s)
      temp_file_out = Tempfile.new('out' + i.to_s)

      max_number = Random.rand(99) + 2          # 2..100
      buffer_size = Random.rand(max_number) + 1 # 1..max_number
      chank_size = Random.rand(max_number) + 1 # 1..max_number
      n = Random.rand(max_number) + 1           # 1..max_number

      begin
        rewriter = FileRewriter.new(temp_file_in, temp_file_out, n, chank_size, max_number)
        rewriter.generate_file
        temp_file_out.open { |x| p x }
 #       numbers = temp_file_in.getlines.map(:to_i)
        #rewriter.rewrite_file

      rescue Exception => e
        errors.push [e, n, chank_size, max_number]
      ensure
        temp_file_in.close
        temp_file_in.unlink
        temp_file_out.close
        temp_file_out.unlink
      end
    end

    p errors.length
    assert_empty errors, 'All random generated files have correct format'
  end
end

#!/usr/bin/env ruby

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require_relative 'main'
require 'tempfile'

# Test case, testing FileRewriter class
class FileRewriterTest < Minitest::Test
  def setup
    @temp_file_in = Tempfile.new('in')
    @temp_file_out = Tempfile.new('out')
  end

  def teardown
    @temp_file_in.unlink
    @temp_file_out.unlink
  end

  def test_generate_chank_lt_n
    check_generate_file(10, 20)
  end

  def test_generate_chank_gt_n
    check_generate_file(10, 5)
  end

  def test_rewrite_file_chank_lt_n
    File.open(@temp_file_in, 'w') do |file|
      file.write([
        1,  2,  3,  4,  5,
        6,  7,  8,  9,  10,
        -1, -2, -3, -4, -5,
        -6, -7, -8, -9, -10
      ].join("\n"))
    end

    rewriter = FileRewriter.new(@temp_file_in, @temp_file_out, 5, 10, 100)
    rewriter.rewrite_file

    assert_equal(IO.read(@temp_file_out), [
      1, 2, 3, 4, 5,
      -1, -2, -3, -4, -5,
      6,  7,  8,  9,  10,
      -6, -7, -8, -9, -10
    ].join("\n"), 'rewrite from 10 to 5 is ok')
  end

  def test_rewrite_file_chank_gt_n
    File.open(@temp_file_in, 'w') do |file|
      file.write([
        1,  2,  3,  4,  5, 6, 7, 8, 9, 10,
        -1, -2, -3, -4, -5, -6, -7, -8, -9, -10,
        1,  2,  3,  4,  5,  6,  7,  8,  9,  10,
        -1, -2, -3, -4, -5, -6, -7, -8, -9, -10
      ].join("\n"))
    end

    rewriter = FileRewriter.new(@temp_file_in, @temp_file_out, 20, 10, 100)
    rewriter.rewrite_file

    assert_equal(IO.read(@temp_file_out), [
      1, 2, 3, 4, 5, 6, 7, 8, 9,  10,
      1,  2,  3,  4,  5,  6,  7,  8,  9,  10,
      -1, -2, -3, -4, -5, -6, -7, -8, -9, -10,
      -1, -2, -3, -4, -5, -6, -7, -8, -9, -10
    ].join("\n"), 'rewrite from 10 to 20 is ok')
  end

  private

  def check_generate_file(chank_size = Random.rand(max_number) + 1,
                          n = Random.rand(max_number) + 1,
                          max_number = 100)
    begin
      rewriter = FileRewriter.new(@temp_file_in, @temp_file_out,
                                  n, chank_size, max_number)
      rewriter.generate_file

      is_odd = true
      errors = []
      @temp_file_in.open do |file|
        lines_counter = 0
        while x = file.gets
          assert (Integer(x) >= 0 && !is_odd) || (Integer(x) <= 0 && is_odd)
          if (lines_counter % n).zero?
            lines_counter += 1
            is_odd = !is_odd
          end
        end
      end
    rescue Exception => e
      errors.push [e, n, chank_size, max_number]
    ensure
      @temp_file_in.close
      @temp_file_out.close
    end

    assert_empty errors, 'All random generated files have correct format'
  end
end

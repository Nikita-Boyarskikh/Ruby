# Rewrite input file F into output file P
# with change size of chanks of same-significal numbers
class FileRewriter
  # Error message, raises if input file F have incorrect format
  BROKEN_FILE_ERROR = 'Unexpected end of file found'.freeze

  # Error message, raises if program can't open file
  PERMISSION_ERROR = 'Can\'t open file. Please, check permissions'.freeze

  def initialize(f, p, n, chank_size = 10, max_number = 100)
    @in_filename = f          # Name of the input file
    @out_filename = p         # Name of the output file
    @n = n                    # Target size of chanks of same-significal numbers (in output file P)
    @chank_size = chank_size  # Size of chanks of same-signigical number in generated input file F
    @max_number = max_number  # Max of the random generated numbers in generated input file F

    @positive = []            # Buffer for positive numbers
    @negative = []            # Buffer for negative numbers
  end

  # Random generates input file F
  def generate_file
    out = File.open(@in_filename, 'w') or raise IOError, PERMISSION_ERROR
    _get_random_number_in_limits.times do
      2.times do |x|
        @chank_size.times do
          out.puts (x.even? ? 1 : -1) * _get_random_number_in_limits
        end
      end
    end
    out.close
  end

  # Rewrites file F into file P with change
  # size of chanks of same-significal numbers
  def rewrite_file
    infile = File.open(@in_filename) or raise IOError, PERMISSION_ERROR
    outfile = File.open(@out_filename, 'w') or raise IOError, PERMISSION_ERROR

    until infile.eof?
      2.times do |x|
        if @n > @chank_size
          _n_gt_chunk_size_rewrite(infile, outfile, x)
        elsif @n < @chank_size
          _n_lt_chunk_size_rewrite(infile, outfile, x)
        end
      end
      until @positive.empty? || @negative.empty?
        _print_n_numbers_from_buffer(@positive, outfile, @n)
        _print_n_numbers_from_buffer(@negative, outfile, @n)
      end
    end

    infile.close
    outfile.close
  end

  private

  # Saves n numbers from input file 'from' into given buffer
  def _save_n_numbers(from, to, n)
    n.times do
      raise EOFError, BROKEN_FILE_ERROR if from.eof?
      to.unshift from.gets
    end
  end

  # Rewrites n numbers from input file 'from' into output file 'to'
  def _rewrite_n_numbers(from, to, n)
    n.times do
      raise EOFError, BROKEN_FILE_ERROR if from.eof?
      to.print from.gets
    end
  end

  # Prints n numbers from given buffer into output file 'to'
  def _print_n_numbers_from_buffer(from, to, n)
    n.times do
      raise EOFError, BROKEN_FILE_ERROR if from.empty?
      to.print from.pop
    end
  end

  # Rewrite numbers from file started with positive
  def _n_gt_chunk_size_rewrite(infile, outfile, x)
    buffer1 = x.odd? ? @positive : @negative
    buffer2 = x.even? ? @positive : @negative

    if buffer1.empty?
      numbers = @n
      while numbers > 0
        # Rewrite @n numbers firstly (without saving) - optimisation
        _rewrite_n_numbers(infile, outfile, @chank_size)
        # Rewrite other numbers using buffers secondly
        _save_n_numbers(infile, buffer2, @chank_size)
        numbers -= @chank_size
      end

      raise EOFError, BROKEN_FILE_ERROR unless numbers.zero?
    else
      _print_n_numbers_from_buffer(buffer1, outfile, @n)
    end
  end

  # Rewrite numbers from file started with negative
  def _n_lt_chunk_size_rewrite(infile, outfile, x)
    buffer = x.even? ? @positive : @negative
    if buffer.empty?
      # Rewrite @n numbers firstly (without saving) - optimisation
      _rewrite_n_numbers(infile, outfile, @n)
      # Rewrite other numbers using buffers secondly
      _save_n_numbers(infile, buffer, @chank_size - @n)
    else
      _print_n_numbers_from_buffer(buffer, outfile, @n)
    end
  end

  # Generates random number from 1 to @max_number
  def _get_random_number_in_limits
    Random.rand(@max_number - 1) + 1
  end
end

class Rk2Controller < ApplicationController
  def input
  end

  def result
    return @error = 'Не передан массив' if params[:array].nil?
    arr = params[:array].split.map(&:to_i)
    count = arr.find_all { |a| (a % 12).zero? }.count
    last_even = arr.rindex(&:even?)
    @error = 'Нет ни одного чётного элемента в массиве' if last_even.nil?
    arr[last_even] = count unless @error
    @result = arr
  end
end

# frozen_string_literal: true

class Integer
  def triangle
    (1..self).reduce(:+) || 1
  end
end

class Squares
  def initialize(num)
    @num = num
  end

  def square_of_sum
    @num.triangle**2
  end

  def sum_of_squares
    squares = (1..@num).to_a.map { |digit| digit**2 }
    squares.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

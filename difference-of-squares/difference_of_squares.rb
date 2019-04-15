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
    return @num.triangle ** 2
  end

  def sum_of_squares 
    squares = *(1..@num).map{ |digit| digit ** 2 }
    return squares.sum
  end

  def difference 
    return square_of_sum - sum_of_squares
  end

end


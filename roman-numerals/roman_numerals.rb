=begin
Write your code for the 'Roman Numerals' exercise in this file. Make the tests in
`roman_numerals_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/roman-numerals` directory.
=end

class Integer
  ROMANS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def to_roman
    return eq(self) if eq(self)

    calculate_eq(self)
  end

  private

  def calculate_eq(num)
    total = 0
    result = []
    until total == num
      active = num - total
      if eq(active)
        total += active
        result << eq(active )
      else
      fact = ROMANS.select { |k, _v| k < active }.max_by { |k, _v| k }
      require 'pry'; binding.pry
      total += fact.first
      result << fact.last
      end
    end
    result.join
  end

  def eq(num)
    ROMANS.dig(num)
  end

  def factors(num)
    1.upto(Math.sqrt(num)).select {|i| (num % i).zero?}.inject([]) do |f, i|
      f << num/i unless i == num/i
      f << i
    end.sort
  end
end

# 1. Find lowest divisor
# 2. Divide by that
# 3. Times do that number of times

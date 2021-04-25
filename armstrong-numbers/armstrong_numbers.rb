# frozen_string_literal: true

# Write your code for the 'Armstrong Numbers' exercise in this file. Make the tests in
# `armstrong_numbers_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/armstrong-numbers` directory.

class ArmstrongNumbers
  def self.include?(num)
    num == calculate_armstrong(num)
  end

  def self.calculate_armstrong(num)
    numbers = num.to_s.chars.map(&:to_i)
    power   = numbers.count
    sum     = 0
    numbers.each do |number|
      sum += number**power
    end
    sum
  end
end

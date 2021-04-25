# frozen_string_literal: true

class Year
  def self.leap?(year)
    (div?(year, 4) && !div?(year, 100)) || div?(year, 400)
  end

  def self.div?(number, divisor)
    number % divisor == 0
  end
end

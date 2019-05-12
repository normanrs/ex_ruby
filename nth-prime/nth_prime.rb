require 'prime'

class Prime 
  def self.nth(num) 
    raise ArgumentError unless is_positiveinteger?(num)
    Prime.take(num).last
  end

  def self.is_positiveinteger?(num)
    ((num.is_a? Integer) && (num > 0))
  end
end
# frozen_string_literal: true

class Luhn
  def self.valid?(string_in)
    nums_string = string_in.gsub(/[^0-9]/, '')
    if wrong_format(string_in) || !luhn(nums_string)
      return false
    else
      return true
    end
  end

  def self.wrong_format(string_in)
    remainder = string_in.gsub(/[0-9]/, '').delete(' ')
    nums_string = string_in.gsub(/[^0-9]/, '')
    return true if nums_string.length < 2 || remainder != ''
  end

  def self.luhn(string_in)
    arr = string_in.chars
    arr.reverse.each_with_index do |num, index|
      arr[index] = if index.odd?
                     luhn_double(num.to_i)
                   else
                     num.to_i
                   end
    end
    arr.sum % 10 == 0
  end

  def self.luhn_double(num)
    doubled = num * 2
    if doubled > 9
      return doubled - 9
    else
      return doubled
    end
  end
end

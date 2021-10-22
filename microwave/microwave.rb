class Microwave
  attr_reader :timer

  def initialize(input)
    @timer = timestring(input)
  end

  def timestring(input)
    converted = (min_convert(input) * 60) + sec_convert(input)
    "#{minutes(converted)}:#{seconds(converted)}"
  end

  def minutes(input)
    string2d((input / 60).truncate)
  end

  def seconds(input)
    string2d(value = input % 60)
  end

  def string2d(value)
    "%02d" % value
  end

  def min_convert(input)
    input.to_s.chars[0..-3].join.to_i
  end

  def sec_convert(input)
    digits = input.digits.reverse
    digits.length < 2 ? digits.unshift(0) : digits
    digits[-2..-1].join.to_i
  end

end


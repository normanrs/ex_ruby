# frozen_string_literal: true

class Raindrops
  def self.convert(num)
    factors   = [3, 5, 7]
    responses = %w[Pling Plang Plong]
    result = []
    factors.each do |factor|
      result << responses[factors.index(factor)] if num % factor == 0
    end
    if result != []
      return result.join
    else
      return num.to_s
    end
  end
end

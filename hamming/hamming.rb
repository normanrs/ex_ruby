class Hamming 

  def self.compute(one, two) 
    if one.length == two.length
      diff_count(one.chars, two.chars)
    else
      raise ArgumentError 
    end
  end

  def self.diff_count(ar1, ar2) 
    result = 0
    ar1.each_with_index do |letter, index| 
      result += 1 if letter != ar2[index]
    end
    result
  end

end
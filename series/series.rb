class Series 

  def initialize(string_in)
    @string_in = string_in
  end

  def slices(x) 
    raise ArgumentError if x > @string_in.length
    arr = @string_in.split(//)
    result = []
    while arr.count > (x-1)
      result << arr[0..(x-1)].join
      arr.slice!(0)
    end
    result
  end
  
end
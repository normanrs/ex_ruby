class Array

  def accumulate
    if self.empty?
      self
    else
      self.map do |elem|
        yield(elem)
      end
    end
  end 
  
end
class Robot 
  @letters = ('AA'..'ZZ').to_a
  @numbers = (0..999).to_a.map {|num| num.to_s.rjust(3, "0")}

  def self.forget 
    @@names = @letters.map {|c1| @numbers.map {|c2| c1 + c2} }.flatten.shuffle
  end

  forget

  attr_reader :name
  
  def initialize
    reset
  end

  def reset 
    @name = @@names.pop
  end

end
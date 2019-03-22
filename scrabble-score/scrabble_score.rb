class Scrabble 

  def initialize(string_in)
    @string_in = string_in
    @scores = {1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
      2 => ['d', 'g'],
      3 => ['b', 'c', 'm', 'p'],
      4 => ['f', 'h', 'v', 'w', 'y'],
      5 => ['k'],
      8 => ['j', 'x'],
     10 => ['q', 'z']
   }
  end

  def score 
    begin
      nums = []
      letters = @string_in.downcase.gsub(/[^a-z]/, '').chars
      letters.each do |letter| 
        @scores.each do |key, value| 
          nums << key if value.include?(letter)
        end
      end
      nums.sum
    rescue => exception
      0
    end
  end

  def self.score(phrase) 
    Scrabble.new(phrase).score
  end

end
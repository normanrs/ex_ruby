class Acronym 
  def self.abbreviate(phrase_in)
    words = phrase_in.gsub(/-/, ' ').split(" ")
    letters = words.map { |word| word[0].upcase }
    return letters.join
  end
end
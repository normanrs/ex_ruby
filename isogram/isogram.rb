# frozen_string_literal: true

class Isogram
  def self.isogram?(phrase)
    checked = Hash.new(0)
    cleaned = phrase.downcase.gsub(/[^a-z]/, '')
    letters = cleaned.chars
    letters.each do |letter|
      checked[letter] += 1
    end
    checked.size == letters.length
  end
end

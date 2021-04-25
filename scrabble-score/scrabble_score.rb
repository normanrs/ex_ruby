# frozen_string_literal: true

class Scrabble
  def initialize(string_in)
    @string_in = string_in
    @scores = { 1 => %w[a e i o u l n r s t],
                2 => %w[d g],
                3 => %w[b c m p],
                4 => %w[f h v w y],
                5 => ['k'],
                8 => %w[j x],
                10 => %w[q z] }
  end

  def score
    nums = []
    letters = @string_in.downcase.gsub(/[^a-z]/, '').chars
    letters.each do |letter|
      @scores.each do |key, value|
        nums << key if value.include?(letter)
      end
    end
    nums.sum
  rescue StandardError => e
    0
  end

  def self.score(phrase)
    Scrabble.new(phrase).score
  end
end

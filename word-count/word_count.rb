# frozen_string_literal: true

class Phrase
  attr_reader :word_count

  def initialize(string_in)
    @words = string_in.downcase.gsub(/\n/, '').split(/,\s|,|\s/)
    @words_hash = Hash.new(0)
  end

  def word_count
    @words.each do |word|
      clean = wash(word)
      @words_hash[clean] += 1 unless clean.empty?
    end
    @words_hash
  end

  def wash(word_in)
    better = word_in.gsub(/[^a-z0-9']/, '')
    better[0] = '' if better[0] == "'"
    better[-1] = '' if better[-1] == "'"
    better
  end
end

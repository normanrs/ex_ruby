# frozen_string_literal: true

class Pangram
  def self.pangram?(sent)
    letters = sent.downcase.gsub(/[^a-z]/, '').chars
    letters.uniq.count == 26
  end
end

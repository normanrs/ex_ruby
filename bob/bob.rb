# frozen_string_literal: true

class Bob
  def self.hey(text_in)
    if text_in.strip.empty?
      'Fine. Be that way!'
    elsif uppercase_letters?(text_in) && text_in[-1] == '?'
      "Calm down, I know what I'm doing!"
    elsif uppercase_letters?(text_in)
      'Whoa, chill out!' unless text_in[-1] == '?'
    elsif text_in.strip[-1] == '?'
      'Sure.'
    else
      'Whatever.'
    end
  end

  def self.uppercase_letters?(string)
    string == string.upcase && string.count('a-zA-Z').positive?
  end
end

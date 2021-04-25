# frozen_string_literal: true

class TwoFer
  def self.two_fer(*text_in)
    if text_in[0]
      "One for #{text_in[0]}, one for me."
    else
      'One for you, one for me.'
    end
  end
end

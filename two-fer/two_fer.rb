class TwoFer 
  def self.two_fer(*text_in)
    if text_in[0]
      return "One for #{text_in[0]}, one for me."
    else
      return "One for you, one for me."
    end
  end
end
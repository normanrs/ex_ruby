require 'date'

module Stock

  def best_profit(array_in)
    best  = array_in.max
    index = array_in.index(best)
    time  = 540 + index
    yesterday = Date.today - 1
    {best => "index"}
  end
end

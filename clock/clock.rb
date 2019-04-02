require 'date'
require 'time'

class Clock 

  attr_reader :result

  def initialize(time_in)
    ballpark = DateTime.now
    today  = DateTime.new(ballpark.year, ballpark.month, ballpark.day, 0, 0, 0, ballpark.zone)
    @result = today + time_offset(time_in)
  end

  def time_offset(hash_in)
    if hash_in[:hour]
      hour = hash_in[:hour]/24.0
    else
      hour = 0
    end
    if hash_in[:minute]
      minute = hash_in[:minute]/1440.0
    else
      minute = 0
    end
    return (hour + minute)
  end

  def to_s 
    @result.strftime('%H:%M')
  end

  def +(diff)
    offset = time_offset({:hour=>diff.result.hour, :minute=>diff.result.minute})
    return (self.result + offset).strftime('%H:%M')
  end

  def -(diff) 
    offset = time_offset({:hour=>diff.result.hour, :minute=>diff.result.minute})
    return (self.result - offset).strftime('%H:%M')
  end

  def ==(clock_in)
    self.result.hour == clock_in.result.hour && self.result.minute == clock_in.result.minute
  end
end
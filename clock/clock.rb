# frozen_string_literal: true

require 'date'
require 'time'

class Clock
  attr_reader :result

  def initialize(time_in)
    ballpark = DateTime.now
    today = DateTime.new(ballpark.year, ballpark.month, ballpark.day, 0, 0, 0, ballpark.zone)
    @result = today + time_offset(time_in)
  end

  def time_offset(hash_in)
    hour = if hash_in[:hour]
             hash_in[:hour] / 24.0
           else
             0
           end
    minute = if hash_in[:minute]
               hash_in[:minute] / 1440.0
             else
               0
             end
    (hour + minute)
  end

  def to_s
    @result.strftime('%H:%M')
  end

  def +(diff)
    offset = time_offset(hour: diff.result.hour, minute: diff.result.minute)
    (result + offset).strftime('%H:%M')
  end

  def -(diff)
    offset = time_offset(hour: diff.result.hour, minute: diff.result.minute)
    (result - offset).strftime('%H:%M')
  end

  def ==(clock_in)
    result.hour == clock_in.result.hour && result.minute == clock_in.result.minute
  end
end

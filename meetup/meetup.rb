require 'date'

DAYS = {
  sunday: 0,
  monday: 1,
  tuesday: 2,
  wednesday: 3,
  thursday: 4,
  friday: 5,
  saturday: 6
}.freeze

NTHS = {
  first: (1..7),
  second: (8..14),
  third: (15..21),
  fourth: (22..28),
  teenth: (13..19),
  last: (-7..-1)
}.freeze

class Meetup
  attr_accessor :month,
                :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(wday, nth)
    base_date = Date.new(self.year, self.month, NTHS[nth].first)
    eligibles = (0..6).map { |add| base_date + add }
    eligibles.find { |x| x.wday == DAYS[wday] }
  end

end
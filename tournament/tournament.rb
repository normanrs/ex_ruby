# frozen_string_literal: true

require_relative 'team'

class Tournament
  class << self
    def tally(input)
      @records = input.split("\n")
      output
    end

    def scores(array)
      teams = Hash.new(0)
      list = []
      array.each { |x| row = x.split(';'); list << row[0]; list << row[1] }
      list.uniq.each { |team| teams[team.to_s] = Team.new(team) }
      array.each do |row|
        game = row.split(';')
        if game[2] == 'win'
          teams[game[0]].MP += 1; teams[game[0]].W += 1; teams[game[0]].P += 3
          teams[game[1]].MP += 1; teams[game[1]].L += 1
        end
      end
      teams.each do |_key, value|
        list << "\n#{value.name}             |  #{value.MP} |  #{value.W} |  #{value.D} |  #{value.L} |  #{value.P}\n"
      end
      list
    end

    def output
      header = 'Team                           | MP |  W |  D |  L |  P'
      header + scores(@records).to_s
    end
  end
end

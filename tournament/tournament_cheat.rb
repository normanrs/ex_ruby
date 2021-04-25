# frozen_string_literal: true

class Tournament
  class << self
    def tally(input)
      results = Hash.new { |hash, key| hash[key] = Team.new(key) }
      normalize_input(input).each do |teamA, teamB, outcome|
        case outcome
        when 'win'
          results[teamA].add_win
          results[teamB].add_loss
        when 'draw'
          results[teamA].add_draw
          results[teamB].add_draw
        when 'loss'
          results[teamA].add_loss
          results[teamB].add_win
        end
      end
      format_results(results)
    end

    private

    HEADER = "Team                           | MP |  W |  D |  L |  P\n"
    DIVIDER = ' | '

    def format_results(results)
      teams = results.values.sort_by { |team| [-team.points, team.name] }
      HEADER + teams.map { |team| format_team(team) }.join
    end

    def format_team(team)
      [
        team.name.ljust(30),
        team.matches_played.to_s.rjust(2),
        team.wins.to_s.rjust(2),
        team.draws.to_s.rjust(2),
        team.losses.to_s.rjust(2),
        team.points.to_s.rjust(2)
      ].join(DIVIDER) + "\n"
    end

    def normalize_input(input)
      input.split("\n").map { |row| row.split(';') }
    end
  end

  class Team
    attr_accessor :name, :wins, :draws, :losses

    def initialize(name)
      @name = name
      @wins = 0
      @draws = 0
      @losses = 0
    end

    def add_win
      @wins += 1
    end

    def add_draw
      @draws += 1
    end

    def add_loss
      @losses += 1
    end

    def matches_played
      @wins + @draws + @losses
    end

    def points
      @wins * 3 + @draws
    end
  end
end

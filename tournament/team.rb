# frozen_string_literal: true

class Team
  attr_accessor :MP,
                :W,
                :D,
                :L,
                :P,
                :name

  def initialize(name)
    @name = name
    @MP   = 0
    @W    = 0
    @D    = 0
    @L    = 0
    @P    = 0
  end

  def add_game(win)
    if win
      require 'pry'; binding.pry
    end
  end
end

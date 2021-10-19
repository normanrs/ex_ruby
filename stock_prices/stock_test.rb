# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'stocks.rb'

class StockTest < Minitest::Test
  include Stock

  def test_best_profit
    stock_data = [10, 7, 5, 8, 11, 9]
    best = best_profit(stock_data)
    assert_equal 11, best
  end
end

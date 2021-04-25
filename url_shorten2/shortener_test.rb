require 'minitest/autorun'
require_relative 'shortener.rb'

class ThingTest < Minitest::Test

  def test_item_creation
    shortener = Shortener.new
    assert_instance_of Shortener, shortener
  end

end

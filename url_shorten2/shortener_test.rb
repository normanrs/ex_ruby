require 'minitest/autorun'
require_relative 'shortener.rb'

class ThingTest < Minitest::Test
  def test_item_creation
    shortener = Shortener.new
    assert_instance_of Shortener, shortener
  end

  def test_urls
    shortener = Shortener.new
    urls = shortener.urls
    refute_empty urls
    assert urls.first.include? 'http://'
  end

  def test_alphanums
    shortener = Shortener.new
    alphanums = shortener.alphanums
    assert_equal 36, alphanums.count
  end

  def test_combinations
    shortener = Shortener.new
    combinations = shortener.alphanumeric_combinations(2)
    assert_equal 630, combinations.count
    assert_equal combinations.count, combinations.uniq.count
  end

  def test_combinations_needed
    shortener = Shortener.new
    needed = shortener.combinations_needed
    assert_instance_of Integer, needed
  end

  def test_shortener
    shortener = Shortener.new
    shortened_urls = shortener.shortened_urls
    assert_equal shortener.urls.count, shortened_urls.count
  end
end

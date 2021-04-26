require 'minitest/autorun'
require_relative 'shortener.rb'

class ShortenerTest < Minitest::Test
  def test_item_creation
    thing = Shortener.new
    assert_instance_of Shortener, thing
  end

  def test_reads_urls_from_csv
    shortener = Shortener.new
    url_list = shortener.urls
    refute_empty url_list
  end

  def test_permutations
    shortener = Shortener.new
    perms3 = shortener.permutations(3)
    assert_equal 1679616, perms3.count
  end

  def test_add_shortened_urls
    shortener = Shortener.new
    urls = shortener.urls
    site_list = shortener.shortened_urls
    assert_equal site_list.count, urls.count
    assert site_list.values.first.include?('http://www.nurl/')
  end
end

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

  def test_add_shortened_urls
    shortener = Shortener.new
    urls = shortener.urls
    site_list = shortener.shortened_urls
    refute_empty site_list
    assert site_list.values.count == site_list.values.uniq.count
    assert_equal site_list.count, urls.count
  end
end

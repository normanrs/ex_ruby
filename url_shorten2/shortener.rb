require 'csv'

class Shortener
  def urls
    CSV.read('urls.csv').flatten
  end

  def alphanums
    [*'0'..'9', *'a'..'z']
  end

  def alphanumeric_combinations(num)
    alphanums.combination(num).map(&:join)
  end

  def combinations_needed
    tries = 0
    count = 0
    while urls.count > count
      count = alphanumeric_combinations(tries + 1).count
      tries += 1
    end
    tries
  end

  def shortened_urls
    result = {}
    codes = alphanumeric_combinations(combinations_needed)
    urls.each do |url|
      result[url] = "http://www.normed_urls/#{codes.pop}"
    end
    result
  end
end

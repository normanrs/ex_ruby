require 'csv'

class Shortener
  # LETTERS = ('a'..'z').to_a
  # NUMBERS = ('0'..'9').to_a
  # ALPHANUMERIC = LETTERS + NUMBERS
  ALPHANUM = [*'a'..'z', *'0'..'9'].freeze

  def urls
    CSV.read('urls.csv').flatten
  end

  def write_shortened
    result = {}
    codes = permutations(digits_needed)
    urls.map do |url|
      result[url] = codes.pop
    end
    result
  end

  def digits_needed
    attempts = 0
    count = 0
    while urls.count > count
      count = permutations(attempts).count
      attempts += 1
    end
    attempts - 1
  end

  def permutations(num)
    ALPHANUM.repeated_permutation(num + 1).map(&:join)
  end
end

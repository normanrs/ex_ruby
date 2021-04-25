# frozen_string_literal: true

require 'prime'
class PrimeFactors
  def self.for(num)
    result = []
    if (num.is_a? Integer) && (num >= 2)
      Prime.prime_division(num).each do |primes|
        primes[1].times { result << primes[0] }
      end
    end
    result
  end
end

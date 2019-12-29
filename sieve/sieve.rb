=begin
Write your code for the 'Sieve' exercise in this file. Make the tests in
`sieve_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sieve` directory.
=end

class Sieve

  def initialize(max) 
    @max_number = max
    @prime_numbers = [2]
    @composite_numbers = []
    @sieve_hash = numeric_hash
  end

  def primes
    if @max_number < 2
      []
    else
      sieve
    end
  end

  def sieve 
   set_primes
    @sieve_hash.map do |number, is_prime| 
      # break if number > @max_number
      number if is_prime
    end.compact
  end

  def set_primes
    set_composites
    @composite_numbers.each do |composite| 
      @sieve_hash[composite] = false
    end
  end

  def numeric_hash
    result = Hash.new
    range_array = (2..@max_number).to_a
    range_array.each do |num| 
      result[num] = true
    end
    result
  end

  def set_composites
    @sieve_hash.each do |number, is_prime|
      (2..@max_number).to_a.each do |power|
        next if number * power > @max_number
        @composite_numbers << number * power 
      end
    end
    @composite_numbers.uniq!
  end
  
end
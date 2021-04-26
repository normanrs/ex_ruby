class Gen
  LOWERS = [*'a'..'z'].freeze
  UPPERS = [*'A'..'Z'].freeze
  NUMS = [*'0'..'9'].freeze
  SPECIALS = %w[& * % & ^ $ - _].freeze

  attr_accessor :characters,
                :special_characters,
                :uppercase_letters,
                :lowercase_letters,
                :digits,
                :password

  def initialize(hash_in)
    @characters         = hash_in[:characters] || 0
    @special_characters = hash_in[:special_characters] || 0
    @uppercase_letters  = hash_in[:uppercase_letters] || 0
    @lowercase_letters  = hash_in[:lowercase_letters] || 0
    @digits             = hash_in[:digits] || 0
    @password           = generated_password
  end

  def generated_password
    result = []
    self.special_characters.times { result << SPECIALS.sample }
    self.uppercase_letters.times { result << UPPERS.sample }
    self.lowercase_letters.times { result << LOWERS.sample }
    self.digits.times { result << NUMS.sample }
    result.join('')
  end

end
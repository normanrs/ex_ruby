class Strength
  # Weak if only letters or less than 8 characters
  # Medium if not weak but has no special characters !%:&()
  # Strong if not weak and has special characters but is under 10 chars
  # Very strong if not weak, has special characters, and has 10 or more chars

  MINIMUM_CHARS = 8
  LONG_CHARS = 10

  def self.password(pwd)
    result = {}
    result[:weak] = weak(pwd)
    result[:medium] = medium(pwd)
    result[:strong] = strong(pwd)
    result[:very_strong] = very_strong(pwd)
    result
  end

  def self.very_strong(pwd)
    return nil if strong(pwd) || medium(pwd) || weak(pwd)

    true
  end

  def self.strong(pwd)
    return nil if medium(pwd) || weak(pwd)

    not_long?(pwd)
  end

  def self.medium(pwd)
    return nil if weak(pwd)

    no_special_chars?(pwd)
  end

  def self.weak(pwd)
    no_numbers?(pwd) || short?(pwd)
  end

  def self.no_numbers?(pwd)
    (pwd.chars & ('0'..'9').to_a).none?
  end

  def self.short?(pwd)
    pwd.length < MINIMUM_CHARS
  end

  def self.no_special_chars?(pwd)
    (pwd.chars & '!%:&()'.chars).none?
  end

  def self.not_long?(pwd)
    pwd.length < LONG_CHARS
  end
end

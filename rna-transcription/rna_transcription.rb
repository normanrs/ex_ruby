class Complement 

  def self.of_dna(sequence)
    replacements = {"G" => "C", "C" => "G", "T" => "A", "A" => "U", "X" => ''}
    letters = sequence.gsub(/[^ACGT]/, 'X').chars
    transcribed = letters.map do |letter| 
      replacements[letter]
    end
    transcribed.join
  end
end
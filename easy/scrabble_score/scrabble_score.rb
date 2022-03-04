class Scrabble
  LETTER_SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  attr_reader :word

  def initialize(word)
    @word = word&.strip&.upcase
  end

  def score
    score = 0
    return score if word.nil? || word.empty?

    @word.chars.each do |letter|
      LETTER_SCORES.each do |points, letters|
        score += points if letters.include?(letter)
      end
    end

    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

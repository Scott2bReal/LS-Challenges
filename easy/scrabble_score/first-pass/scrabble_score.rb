class Scrabble
  LETTER_SCORES = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %(q z)
  }

  def initialize(word)
    @word = process_word(word)
  end

  def score
    @word.chars.map { |letter| letter_score(letter) }.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def letter_score(letter)
    LETTER_SCORES.each do |score, letters|
      return score if letters.include?(letter)
    end
    0
  end

  def process_word(word)
    word ? word.downcase.strip : ''
  end
end

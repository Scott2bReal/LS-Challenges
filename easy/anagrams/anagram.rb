class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    return false if word.downcase == @word.downcase

    sort_letters(word) == sort_letters(@word)
  end

  def sort_letters(word)
    word.downcase.chars.sort
  end
end

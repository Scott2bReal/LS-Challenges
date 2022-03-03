class Anagram
  def initialize(word)
    @word = word
  end

  # My original solution
  #
  # def match(word_list)
  #   word_list.select do |word|
  #     word.downcase.chars.sort == @word.downcase.chars.sort &&
  #       word.downcase != @word.downcase
  #   end
  # end

  # Book solution(ish)
  def match(word_list)
    word_list.select do |word|
      anagram?(word) && word.downcase != @word.downcase
    end
  end

  private

  def sort_letters(word)
    word.downcase.chars.sort
  end

  def anagram?(word)
    sort_letters(@word) == sort_letters(word)
  end
end

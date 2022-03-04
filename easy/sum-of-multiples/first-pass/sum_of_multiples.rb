class SumOfMultiples
  def initialize(*set)
    @set = set.to_a
  end

  def self.to(input)
    SumOfMultiples.new(3, 5).to(input)
  end

  def to(input)
    multiples = []

    (1...input).to_a.each do |num|
      @set.each do |set_num|
        multiples << num if (num % set_num).zero?
      end
    end

    multiples.uniq.sum
  end
end

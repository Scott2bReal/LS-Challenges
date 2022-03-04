class Series
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def slices(size)
    raise ArgumentError if size > input.length

    array = []

    input.chars.map(&:to_i).each_cons(size) do |slice|
      array << slice
    end

    array
  end
end

class Series
  def initialize(input)
    @input = input.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @input.size

    slices = []
    @input.each_cons(slice_size) do |slice|
      slices << slice
    end
    slices
  end
end

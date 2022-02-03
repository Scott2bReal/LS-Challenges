class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    strands = [self.strand.chars, other_strand.chars].sort_by(&:size)
    counter = 0

    strands[0].each_with_index do |letter, idx|
      counter += 1 unless letter == strands[1][idx]
    end

    counter
  end
end

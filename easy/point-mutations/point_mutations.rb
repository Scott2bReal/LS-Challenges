class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    
    strand.chars.each_with_index do |letter, idx|
      break if idx > other_strand.size - 1

      distance += 1 unless letter == other_strand[idx]
    end

    distance
  end
end

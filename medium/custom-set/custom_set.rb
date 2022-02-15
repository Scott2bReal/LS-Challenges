class CustomSet
  def initialize(items=nil)
    @items = items
  end

  def add(item)
  end

  def empty?
    return true unless @items
    false
  end

  def contains?(item)
    return true if @items&.include?(item)
    false
  end

  def subset?
  end

  def disjoint?
  end

  def eql?
  end

  def intersection
  end

  def difference
  end

  def union
  end
end

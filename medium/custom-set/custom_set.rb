class CustomSet
  def initialize(items=nil)
    if items
      @items = items
    else
      @items = []
    end
  end

  def add(item)
    @items.push(item)
  end

  def empty?
    @items.empty?
  end

  def contains?(other_set)
    return true if empty? && other_set.empty?
    @items.include?(other_set)
  end

  def subset?(other_set)
    contains?(other_set)
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

class CustomSet
  def initialize(items=[])
    @items = items.uniq
  end

  def add(item)
    @items.push(item)
    @items.uniq!
    self
  end

  def empty?
    @items.empty?
  end

  def contains?(value)
    @items.include? value
  end

  def subset?(other_set)
    @items.each do |item|
      return false unless other_set.contains?(item)
    end

    true
  end

  def disjoint?(other_set)
    return true if empty? || other_set.empty?
    @items.each do |item|
      return false if other_set.contains?(item)
    end
    true
  end

  def eql?(other_set)
    @items.sort == other_set.items.sort
  end

  def ==(other_set)
    eql?(other_set)
  end

  def intersection(other_set)
    @items.each_with_object(CustomSet.new) do |item, intersection_set|
      intersection_set.add(item) if other_set.contains?(item)
    end
  end

  def difference(other_set)
    @items.each_with_object(CustomSet.new) do |item, difference_set|
      difference_set.add(item) unless other_set.contains?(item)
    end
  end

  def union(other_set)
    union_set = CustomSet.new
    [self, other_set].each do |set|
      set.items.each { |item| union_set.add(item) }
    end
    union_set
  end
  
  protected

  attr_accessor :items
end

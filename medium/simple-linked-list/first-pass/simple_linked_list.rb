class Element
  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  attr_reader :datum
  attr_accessor :next

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def empty?
    return true if size.zero?
    false
  end

  def size
    list_size = 0
    next_element = @head

    until next_element.nil?
      list_size += 1
      next_element = next_element.next
    end

    list_size
  end

  def push(value)
    element = Element.new(value, @head)
    self.head = element
  end

  def pop
    popped = @head
    self.head = head.next
    popped.datum
  end

  def peek
    @head&.datum
  end

  def to_a
    array = []
    next_element = head

    until next_element.nil?
      array << next_element.datum
      next_element = next_element.next
    end

    array
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    array&.reverse_each { |item| list.push(item) }
    list
  end
end

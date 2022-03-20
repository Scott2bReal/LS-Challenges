class SimpleLinkedList
  def initialize
    @size = 0
  end

  attr_accessor :head
  attr_reader :size

  def empty?
    size == 0
  end

  def push(input)
    self.size += 1
    self.head = Element.new(input, @head)
    self
  end

  def peek
    @head&.datum
  end

  def pop
    self.size -= 1
    old_head = head
    self.head = head.next
    old_head.datum
  end

  def to_a
    array = []
    return array if empty?

    current_element = head

    loop do
      array << current_element.datum
      break if current_element.tail?

      current_element = current_element.next
    end

    array
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def self.from_a(array)
    return new unless array
    new_list = new
    array.reverse_each { |datum| new_list.push(datum) }
    new_list
  end

  private

  attr_writer :size
end

class Element
  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  attr_reader :datum, :next

  def tail?
    return true unless @next
    false
  end
end

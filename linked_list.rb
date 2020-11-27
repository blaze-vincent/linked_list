require_relative 'node'

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if @tail.nil?
      @tail = Node.new(value)
      @head = @tail
    else
      @tail = Node.new(value, @tail, nil)
      @head.next_node = @tail if @size == 1
    end
    @size += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @head = Node.new(value, nil, @head)
      @tail.prev_node = @head if @size == 1
    end
    @size += 1
  end

  def at(index)
    # where index of 0 is the first node
    if index > (@size - 1)
      "An element with the index #{index} does not exist."
    else
      node = @head
      while index.positive?
        node = node.next_node
        index -= 1
      end
      node.value
    end
  end

  def pop
    if @size > 1
      @tail.prev_node.next_node = nil
      @tail = @tail.prev_node
    elsif @size == 1
      @tail = nil
      @head = nil
    end
    @size -= 1
  end

  def contains?(value)
    node = @head
    node = node.next_node until (node.value == value) || node.next_node.nil?
    node.value == value
  end

  def find(value)
    node = @head
    index = 0
    until (node.value == value) || node.next_node.nil?
      node = node.next_node
      index += 1
    end
    node.value == value ? index : nil
  end
end

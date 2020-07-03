require_relative 'node'
require 'pry'

class Linked_list
  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      node_iterator = @head
      print @head.next_node
      until node_iterator.next_node.nil?
        node_iterator = node_iterator.next_node
      end
      node_iterator.next_node = Node.new(data)
    end
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      new_node = @head
      @head = Node.new(data, next: new_node)
    end
  end
end

abc = Linked_list.new
abc.append("node a")
abc.append("node b")
abc.prepend("node c")
abc.append("node d")
binding.pry

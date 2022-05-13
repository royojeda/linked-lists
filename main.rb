class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
    else
      tail.next_node = new_node
    end
    self.tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    if head.nil?
      self.tail = new_node
    else
      new_node.next_node = head
    end
    self.head = new_node
  end

  def size
    count = 0
    current = head
    until current.nil?
      count += 1
      current = current.next_node
    end
    count
  end
end

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

a = LinkedList.new
a.prepend('hello')
a.prepend('world')
a.prepend('test')
p a.size

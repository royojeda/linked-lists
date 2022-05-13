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

  def at(index)
    current_index = 0
    current_node = head
    until current_index == index
      current_node = current_node.next_node
      current_index += 1
    end
    current_node
  end

  def pop
    current_index = 0
    current_node = head
    until current_index == size - 2
      current_node = current_node.next_node
      current_index += 1
    end
    self.tail = current_node
    current_node.next_node = nil
  end

  def contains?(value)
    current_index = 0
    current_node = head
    until current_index == size
      return true if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
    end
    false
  end

  def find(value)
    current_index = 0
    current_node = head
    until current_index == size
      return current_index if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
    end
    nil
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
a.append('yes')
a.append('no')

# test, world, hello, yes, no
p a.contains?('no')

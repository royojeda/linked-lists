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
    loop do
      current_node = current_node.next_node
      current_index += 1
      break if current_node.next_node.next_node.nil?
    end
    self.tail = current_node
    current_node.next_node = nil
  end

  def contains?(value)
    current_index = 0
    current_node = head
    loop do
      return true if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
      break if current_node.nil?
    end
    false
  end

  def find(value)
    current_index = 0
    current_node = head
    loop do
      return current_index if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
      break if current_node.nil?
    end
  end

  def to_s
    current_index = 0
    current_node = head
    list = ''
    loop do
      list += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
      current_index += 1
      break if current_node.nil?
    end
    "#{list}nil"
  end

  def insert_at(value, index)
    if index > size || index.negative?
      puts 'Error. Index is out of range.'
    elsif index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      new_node = Node.new(value)
      current_index = 0
      current_node = head
      until current_index == index - 1
        current_node = current_node.next_node
        current_index += 1
      end
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end

  def remove_at(index)
    if index >= size || index.negative?
      puts 'Error. Index is out of range.'
    elsif index.zero?
      self.head = head.next_node
    else
      current_index = 0
      current_node = head
      until current_index == index - 1
        current_node = current_node.next_node
        current_index += 1
      end
      current_node.next_node = current_node.next_node.next_node
    end
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
a.insert_at('3', 0)
a.insert_at('norm', 3)
a.insert_at('nil', 7)
puts a
a.remove_at(8)
a.remove_at(7)
a.remove_at(0)
a.remove_at(4)
a.remove_at(9)
puts a

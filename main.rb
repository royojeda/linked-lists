class LinkedList

end

class Node
    attr_reader :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

p Node.new.value

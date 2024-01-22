class Node
  attr_accessor :next_node, :value

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :node

  def initialize(value)
    @node = Node.new(value)
  end

  def append(value)
    current = @node
    current = current.next_node until current.next_node.nil?
    current.next_node = Node.new(value)
  end

  def prepend(value)
    current = @node
    @node = Node.new(value)
    @node.next_node = current
  end

  def size
    current = @node
    i = 0
    until current.nil?
      i += 1
      current = current.next_node
    end
    i # Like array.length [highest + 1]
  end

  def head
    Node.new(@node.value)
  end

  def tail
    current = @node
    current = current.next_node until current.next_node.nil?
    Node.new(current.value)
  end

  def at(index)
    current = @node
    i = -1 # The first elem is 0
    until current.nil?
      i += 1
      return Node.new(current.value) if i == index

      current = current.next_node
    end
    nil
  end

  def pop
    return nil if @node.next_node.nil?

    current = @node
    current = current.next_node until current.next_node.nil? or current.next_node.next_node.nil?
    current.next_node = nil
  end

  def find(value)
    current = @node
    i = -1 # The first elem is 0
    until current.nil?
      i += 1
      return i if current.value == value

      current = current.next_node
    end
    nil
  end

  def contains?(value)
    !find(value).nil?
  end

  def to_s
    current = @node
    until current.next_node.nil?
      print "( #{current.value} ) -> "
      current = current.next_node
    end
    print "( #{current.value} ) -> nil"
  end

  def remove_at(index)
    return nil if @node.next_node.nil?
    return @node = @node.next_node if index.zero?

    current = @node
    i = 0 # The first elem is 1
    until current.next_node.nil?
      i += 1
      return current.next_node = current.next_node.next_node if index == i

      current = current.next_node
    end
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    current = @node
    i = 0 # The first elem is 1
    until current.nil?
      i += 1
      if index == i
        a = current.next_node
        current.next_node = Node.new(value)
        current.next_node.next_node = a
        return
      end

      current = current.next_node
    end
  end
end

# linked_list = LinkedList.new(5)
# linked_list.pop

# linked_list.append(6)
# linked_list.prepend(4)
# linked_list.prepend(3)
# linked_list.append(7)

# puts "\nINITIAL LIST: #{linked_list}"
# # Initial list: 3 -> 4 -> 5 -> 6 -> 7

# linked_list.pop
# puts "\nAFTER POP: #{linked_list}"
# # After pop: 3 -> 4 -> 5 -> 6

# linked_list.remove_at(0)
# puts "\nAFTER REMOVE_AT(0): #{linked_list}"
# # After remove_at(0): 4 -> 5 -> 6

# linked_list.remove_at(2)
# puts "\nAFTER REMOVE_AT(2): #{linked_list}"
# # After remove_at(2): 4 -> 5

# linked_list.remove_at(20)
# puts "\nAFTER REMOVE_AT(20): #{linked_list}"
# # After remove_at(20): 4 -> 5 (no change because index 20 is beyond the list)

# linked_list.insert_at(8, 2)
# puts "\nAFTER INSERT_AT(8, 2): #{linked_list}"
# # After insert_at(8, 2): 4 -> 5 -> 8

# linked_list.insert_at(88, 20)
# puts "\nAFTER INSERT_AT(88, 20): #{linked_list}"
# # After insert_at(88, 20): 4 -> 5 -> 8 (no change because index 20 is beyond the list)

# linked_list.insert_at(2, 0)
# puts "\nAFTER INSERT_AT(2, 0): #{linked_list}"
# # After insert_at(2, 0): 2 -> 4 -> 5 -> 8

# puts "\nSIZE: #{linked_list.size}"
# # Size: 4

# puts "HEAD: #{linked_list.head&.value}"
# # Head: 2

# puts "TAIL: #{linked_list.tail&.value}"
# # Tail: 8

# puts "\nFINDING"
# puts "Index of 8: #{linked_list.find(8)}"
# # Index of 8: 2

# puts "Index of 9: #{linked_list.find(9)}"
# # Index of 9: nil (9 not found)

# puts "\nCONTAINS"
# puts "Contains 2: #{linked_list.contains?(2)}"
# # Contains 2: true

# puts "Contains 5: #{linked_list.contains?(5)}"
# # Contains 5: true

# puts "Contains 9: #{linked_list.contains?(9)}"
# # Contains 9: false

# puts "\nAT INDEX 2: #{linked_list.at(2)}"
# # At index 2: 5

# puts "\nLINKED LIST AS STRING: #{linked_list}"
# # Linked list as string: 2 -> 4 -> 5 -> 8

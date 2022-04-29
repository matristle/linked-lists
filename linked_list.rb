require_relative 'node'

class LinkedList
  def initialize(head = nil)
    @head = head
  end

  def append(value)
    temp_node = @head

    temp_node = temp_node.next_node until temp_node.next_node.nil?

    temp_node.next_node = Node.new(value, nil)
  end

  def prepend(value)
    temp_node = @head

    @head = Node.new(value, temp_node)
  end

  def size
    temp_node = @head
    count = 0

    until temp_node.nil?
      count += 1
      temp_node = temp_node.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    temp_node = @head

    temp_node = temp_node.next_node until temp_node.next_node.nil?

    temp_node
  end

  def at(index)
    temp_node = @head

    index.times do
      temp_node = temp_node.next_node
    end

    temp_node
  end

  def pop
    temp_node = @head
    until temp_node.next_node.next_node.nil?
      temp_node = temp_node.next_node
      if temp_node.next_node.next_node.nil?
        temp_node.next_node = nil
        break
      end
    end
  end

  def contains?(value)
    temp_node = @head

    size.times do
      return true if temp_node.value == value

      temp_node = temp_node.next_node
    end

    false
  end

  def find(value)
    temp_node = @head
    size.times do |index|
      return index if temp_node.value == value

      temp_node = temp_node.next_node
    end

    nil
  end

  def to_s
    # ( value ) -> ( value ) -> ( value ) -> nil
    string = String.new

    (size + 1).times do |index|
      string << if index == size 
                  'nil'
                else
                  "( #{at(index).value} ) -> "
                end
    end
    string
  end

  def insert_at(value, index)

  end
end

#---------------------------------------------------------

list = LinkedList.new

list.prepend('Sally')
list.prepend('Sunny')
list.prepend('Theo')
list.append('Angelica')

# p list
# p list.size
# p list.tail

# list.size.times do |index|
#   p list.at(index)
# end
# p list

# p list.contains?('Theo')
# p list.contains?('Chloe')

# p list.find('Angelica')

# p list.to_s

# list.pop
# p list

p list.to_s

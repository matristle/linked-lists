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

  def to_s(string = String.new)
    # ( value ) -> ( value ) -> ( value ) -> nil

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
    temp_node = at(index - 1)
    temp_node.next_node = Node.new(value, temp_node.next_node)
  end

  def remove_at(index)
    previous_node = at(index - 1)
    current_node = at(index)

    previous_node.next_node = current_node.next_node
  end

  # recursive methods - alternative to the iterative methods above

  def append_rec(value, temp_node = @head)
    if temp_node.next_node.nil?
      temp_node.next_node = Node.new(value, nil)
    else
      append_rec(value, temp_node.next_node)
    end
  end

  # No recursion invited for #prepend

  def size_rec(count = 0, temp_node = @head)
    return count if temp_node.nil?

    size_rec(count += 1, temp_node.next_node)
  end

  # No recursion invited for #head

  # No recursion invited for #tail

  def at_rec(index, temp_node = @head, count = 0)
    if count == index
      temp_node
    else
      temp_node = temp_node.next_node
      at_rec(index, temp_node, count += 1)
    end
  end

  def pop_rec(temp_node = @head)
    if temp_node.next_node.next_node.nil?
      temp_node.next_node = nil
    else 
      pop_rec(temp_node.next_node)
    end
  end

  def contains_rec?(value, temp_node = @head)
    return true if temp_node.value == value

    return false if temp_node.next_node.nil?

    contains_rec?(value, temp_node.next_node)
  end

  def find_rec(value, temp_node = @head, count = 0)
    return count if temp_node.value == value

    return nil if temp_node.next_node.nil?

    find_rec(value, temp_node.next_node, count += 1)
  end

  def to_s_rec(string = String.new, count = 0)
    # ( value ) -> ( value ) -> ( value ) -> nil

    return string << 'nil' if count == size

    string << "( #{at(count).value} ) -> "

    to_s_rec(string, count += 1)
  end
end

#--Iterative method tests---------------------------------------------------

list = LinkedList.new

# list.prepend('Sally')
# list.prepend('Sunny')
# list.prepend('Theo')
# list.append('Angelica')

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

# p list.to_s

# list.insert_at('Bob', 2)
# p list.to_s

# list.remove_at('Bob', 2)
# p list.to_s

#-- Recursive method tests -----------------------------------------------------------

list.prepend('Sally')
list.prepend('Sunny')
list.prepend('Theo')
list.append_rec('Angelica')

p list

p list.size_rec

list.size_rec.times do |index|
  p list.at_rec(index)
end
p list

p list

list.pop_rec

p list

p list.contains_rec?('Carl')

p list.find_rec('Sunny')

p list.to_s_rec









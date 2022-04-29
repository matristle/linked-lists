require_relative "node.rb"

class LinkedList

    def initialize(head = nil)
        @head = head
    end

    def append(value)
        temp_node = @head

        until temp_node.next_node.nil? do
            temp_node = temp_node.next_node
        end 

        temp_node.next_node = Node.new(value, nil)
    end

    def prepend(value)
        temp_node = @head

        @head = Node.new(value, temp_node)
    end

    def size
        temp_node = @head
        count = 0

        until temp_node.nil? do
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
        
        until temp_node.next_node.nil? do
            temp_node = temp_node.next_node
        end

        temp_node
    end

    def at(index)
        temp_node = @head

        index.times do 
            temp_node = temp_node.next_node
        end

        temp_node
    end

    def contains?(value)
        temp_node = head

        self.size.times do
            if temp_node.value == value
                return true
                break
            end 
            temp_node = temp_node.next_node
        end

        return false
    end

       
end

list = LinkedList.new

list.prepend('Sally')
list.prepend('Sunny')
list.prepend('Theo')
list.append('Angelica')

# p list

p list.size
# p list.tail

# list.size.times do |index| 
#     p list.at(index)
# end

p list

p list.contains?('Theo')
p list.contains?('Chloe')



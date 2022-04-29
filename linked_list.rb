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

    
end

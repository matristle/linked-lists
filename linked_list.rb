require_relative "node.rb"

class LinkedList

    def initialize(head = nil)
        @head = head
    end

    
end

list = LinkedList.new

list.prepend('Sally')
list.prepend('Sunny')
list.prepend('Theo')

list.append('Angelica')

p list.size
p list

p list.tail





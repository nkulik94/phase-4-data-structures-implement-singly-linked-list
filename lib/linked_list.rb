require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend node
        node.next_node = self.head
        self.head = node
    end

    def append node
        if !self.head
            return self.head = node
        end

        last_node = self.head
        last_node = last_node.next_node until !last_node.next_node
        last_node.next_node = node
    end

    def delete_head
        if self.head
            self.head = self.head.next_node
        end
    end

    def delete_tail
        if self.head
            next_to_last_node = self.head
            if !next_to_last_node.next_node
                return self.head = nil
            end
            next_to_last_node = next_to_last_node.next_node until !next_to_last_node.next_node.next_node
            next_to_last_node.next_node = nil
        end
    end

    def add_after index, node
        i = 0
        index_node = head
        while i < index
            index_node = index_node.next_node
            i += 1
        end
        node.next_node = index_node.next_node
        index_node.next_node = node
    end

    def search value
        found_node = self.head
        found_node = found_node.next_node until found_node.data = value
        found_node
    end
end

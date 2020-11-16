require "byebug"

class PolyTreeNode
    attr_accessor :parent, :children, :value

    def initialize(value)
        @value = value
        @children = Array.new() 
        @parent = nil
    end

    def parent=(parent_node)
        @parent.children.delete(self) if self.parent != nil

        @parent = parent_node 
        if parent_node != nil && !parent_node.children.include?(self)
            parent_node.children << self
        end
    end

    def add_child(child)
        if !self.children.include?(child)
            self.children << child
            child.parent = self
        end
    end

    def remove_child(child)
        raise 'not my kid!' if !self.children.include?(child)
        child.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child| 
            search_results = child.dfs(target_value)
            return search_results unless search_results.nil?
        end
        nil

    end

    def bfs(target_value)
        queue = [self]

        until queue.empty?
            el = queue.shift
            if el.value == target_value
                return el 
            end

            el.children.each {|child| queue << child}
        end
    end
end

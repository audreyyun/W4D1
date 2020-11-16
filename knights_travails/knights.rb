require_relative 'knight_treenode.rb'

class KnightPathFinder
    #move with confines of the board
    #can add/subtract a one/two or two/one per [row][col], and vise verse
    #we start at [0, 0] which is the root node
    #

    def self.root_node(start_pos)
        PolyTreeNode.new(start_pos)
    end

    def self.valid_moves(pos)


    end

    def initialize(start_pos)
        @root = KnightPathFinder.root_node(start_pos)
        @board = Array.new(8) {Array.new(8, [])}
        @movetree = self.build_move_tree
        @considered_positions = [start_pos]
    end

    def build_move_tree(pos)
        que = [pos]
        
        until que.empty?
            el = que.shift
            unless @considered_positions.include?(el)
                self.class.valid_moves(el)
        end
        
    end

    def new_move_positions(pos)
        if !@considered_positions.include?(self.class.valid_moves(pos))
            @considered_positions << pos
        end
        return @considered_positions
    end

    # def find_path(end_pos)
    #     #build a move tree
    # end



end
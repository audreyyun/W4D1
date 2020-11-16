require_relative 'knight_treenode.rb'
require "set"

class KnightPathFinder
    #move with confines of the board
    #can add/subtract a one/two or two/one per [row][col], and vise verse
    #we start at [0, 0] which is the root node
    #

    def self.root_node(start_pos)
        PolyTreeNode.new(start_pos)
    end

    def self.valid_moves(pos) #would give all 8 possible positions, regardless 
        #pass in position, give all 8 moves
        # visited.push(pos)

        
    end

    def initialize(start_pos) #takes in an array
        @root = KnightPathFinder.root_node(start_pos) #call in knight_treenode, create tree
        # @board = Array.new(8) {Array.new(8, [])}
        @movetree = self.build_move_tree(start_pos)
        @considered_positions = [start_pos]
        # @considered_positions.push(start_pos) #come back to adding start position in initialize
    end

    def build_move_tree(pos) #bfs to find the next possible (8)positions
        # que = [pos]
        
        # until que.empty?
        #     el = que.shift
        #     unless @considered_positions.include?(el)
        #         self.class.valid_moves(el)
        #     end
        # end 
    end

    def new_move_positions(pos)
        if !@considered_positions.include?(self.class.valid_moves(pos)) #will need to be rewritten to iterate through all valid moves 
            @considered_positions << pos
        end
        return @considered_positions
    end

    # def find_path(end_pos)
    #     #build a move tree
    # end



end
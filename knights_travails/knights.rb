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
        possible_positions = [[1, 2],[1, -2],[2, 1],[2, -1],[-1, -2],[-1, 2],[-2, -1],[-2, 1]]
        
        all_moves = possible_positions.map do |position|
            [pos[0] + position[0], pos[1] + position[1]]
        end

        all_moves.select do |position|
            (position[0] <= 7 && position[0] >= 0) && (position[1] <= 7 && position[1] >= 0)
        end
        
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
        new_arr = []
        self.class.valid_moves(pos).each do |position|
            if !@considered_positions.include?(position)
                new_arr << position
            end
        end

        @considered_positions += new_arr
        new_arr
    end

    # def find_path(end_pos)
    #     #build a move tree
    # end



end
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
        #return an array of just positions
    end

    def initialize(start_pos) #takes in an array of start position
        @root = KnightPathFinder.root_node(start_pos) #call in knight_treenode, create node
        @movetree = self.build_move_tree
        @considered_positions = [start_pos]
    end

    def build_move_tree #To ensure that your tree represents only the shortest path to a given position, aka target
        queue = [@root]
        el = queue[0]
        
        until queue.empty?
            el = queue.shift
            queue += new_move_positions(el)
        end 
    end



    def new_move_positions(pos)
        new_arr = []
        self.class.valid_moves(pos.value).each do |position|
            if !@considered_positions.include?(position)
                @considered_positions << position
                new_arr << PolyTreeNode.new(position)
            end
        end
        new_arr
    end

    # def find_path(end_pos)
    #     #build a move tree
    # end



end
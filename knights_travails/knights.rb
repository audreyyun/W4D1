require_relative 'knight_treenode.rb'
require "set"
require "byebug"

class KnightPathFinder
    #move with confines of the board
    #can add/subtract a one/two or two/one per [row][col], and vise verse
    #we start at [0, 0] which is the root node
    attr_reader :root
    def self.root_node(start_pos)
        PolyTreeNode.new(start_pos)
    end

    def self.valid_moves(pos) #would give all 8 possible positions, regardless 
        possible_positions = [[1, 2],[1, -2],[2, 1],[2, -1],[-1, -2],[-1, 2],[-2, -1],[-2, 1]]
        
        all_moves = possible_positions.map do |position|
            [pos[0] + position[0], pos[1] + position[1]] 
        end

        final_moves = all_moves.select do |position|
            (position[0] <= 7 && position[0] >= 0) && (position[1] <= 7 && position[1] >= 0)
        end
        #return an array of just positions
        final_moves
    end

    def initialize(start_pos) #takes in an array of start position
        @root = KnightPathFinder.root_node(start_pos) #call in knight_treenode, create node. Will navigate from here
        @considered_positions = [start_pos]
        self.build_move_tree
    end

    def build_move_tree #Should be accepting array of positions and converting to nodes, should add child to the parent 
        queue = [@root] # make sure we're adding the nodes into the que
        
        until queue.empty?
            el = queue.shift
            positions_from_el = new_move_positions(el)
            positions_from_el.each do |pos|
                new_child = PolyTreeNode.new(pos)
                new_child.parent = el
                queue << new_child
                el.children << new_child
            end
        end 
    end


    def new_move_positions(pos) #should just be returning arrays of positions, don't return notes
        new_arr = []

        self.class.valid_moves(pos.value).each do |position|
            if !@considered_positions.include?(position)
                new_arr << position
            end
        end
        @considered_positions += new_arr
        new_arr
    end

    def find_path(end_pos)
        trace = trace_path_back(@root.dfs(end_pos)) # takes in the bottom treenode
        trace.reverse
    end

    def trace_path_back(last_node)
        return [last_node.value] if last_node.parent.nil?

        parents = []

        parents << last_node.value
        next_node = trace_path_back(last_node.parent)

        parents + next_node
    end


end
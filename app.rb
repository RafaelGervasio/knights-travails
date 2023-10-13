class Board
    attr_accessor :board, :possible_moves

    def initialize 
        @board = []
        @possible_moves = [[1, 2] , [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    end

    def knight_moves(starting_node, end_node, queue = [starting_node])
        path = []
        until queue[0] == end_node
            if queue[0].visited = false
                queue[0].visited = true
                path.push(queue[0])
            end
            queue[0].shift()
            generate_paths(queue[0]).map {|arr| queue.push(arr)} 
        end
        path.push(queue[0])
        path
        
    end

    def generate_paths(node)
        legal_moves = []

        self.possible_moves.map do |combo|
            if node.x + combo[0] > 7 || node.y + combo[1] > 7
                #ilegal move
            elsif node.x + combo[0] < 0 || node.y + combo[1] < 0
                #ilegal move
            else
                legal_moves.push([node.x + combo[0], node.y + combo[1]])
            end
        end
        legal_moves
    end


end
   
class Node
    attr_accessor :x, :y, :visited 

    def initialize(x, y)
        @x = x
        @y = y
        @visited = false
    end
end



# starting_node = Node.new(starting_node[0], starting_node[1])
# end_node = Node.new(end_node[0], end_node[1])


test_node = Node.new(3, 3)
b = Board.new
p b.generate_paths(test_node)
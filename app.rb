class Board
    attr_accessor :possible_moves

    def initialize 
        @possible_moves = [[1, 2] , [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    end

    def knight_moves(starting_node, end_node, queue = [starting_node])
        until queue[0].x == end_node.x && queue[0].y == end_node.y
            if queue[0].visited == false
                queue[0].visited = true
            end
            generate_paths(queue[0]).map {|arr| queue.push(Node.new(arr[0], arr[1], queue[0]))} 
            queue.shift()
        end
        puts "You made it in #{get_path(queue[0]).length - 1} moves! Here's your path:"
        puts "#{get_path(queue[0])}"
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

    def get_path (node)
        path = []
        until node.ptr.nil?
            path.unshift([node.x, node.y])
            node = node.ptr
        end
        path.unshift([node.x, node.y])
        path
    end
end
   
class Node
    attr_accessor :x, :y, :ptr, :visited 

    def initialize(x, y, ptr = nil)
        @x = x
        @y = y
        @ptr = ptr
        @visited = false
    end
end


test_node = Node.new(0, 0)
test_node_2 = Node.new(7, 7)


b = Board.new
b.knight_moves(test_node, test_node_2)
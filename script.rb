#+2+1, +2-1, +1+2, +1-2, -1+2, -1-2, -2+1, -2-1

class Chess_board
    attr_accessor :vertices

    def initialize(array)
        nodes = array.repeated_permutation(2).to_a
        @vertices = {}
        create_board(nodes)
    end

    def create_board(nodes)
        nodes.each do |node|
            vertices[node] = []
        end

        vertices.each do |k,v|
            add_neighbors(k,v)
        end
        vertices
    end

    def add_neighbors(k,v)
        moves = [[+2,+1], [+2,-1], [+1,+2], [+1,-2], [-1,+2], [-1,-2], [-2,+1], [-2,-1]]

        moves.each do |move|
            x = k[0] + move[0]
            y = k[1] + move[1]
            v << [x,y] if x.between?(1,8) && y.between?(1,8)
        end 
        v 
    end

    def shortest_path(first,last)
        queue = []
        queue.push(first)
        distance = 0

        

        

end

board = Chess_board.new([1,2,3,4,5,6,7,8])
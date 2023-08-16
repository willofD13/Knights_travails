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
    end

        

end

board = Chess_board.new([1,2,3,4,5,6,7,8])
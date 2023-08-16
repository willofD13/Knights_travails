class Chess_board

    def initialize(array)
        @vertices = array.repeated_permutation(2).to_a
    end
end

board = Chess_board.new([1,2,3,4,5,6,7,8])
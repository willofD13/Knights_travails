#+2+1, +2-1, +1+2, +1-2, -1+2, -1-2, -2+1, -2-1

class Node 
    attr_accessor :predecessor, :distance, :value

    def initialize(value,predecessor = nil, distance = nil)
        @value = value
        @predecessor = predecessor
        @distance = distance
    end
end

class Chess_board
    attr_accessor :vertices, :nodes

    def initialize(array)
        @nodes = array.repeated_permutation(2).to_a
        index = 0
        
        while index < @nodes.length
            @nodes[index] = Node.new(@nodes[index])
            index += 1
        end
        
        @vertices = {}
        create_board(@nodes)
    end

    def create_board(nodes)
        nodes.each do |node|
            vertices[node] = []
        end

        vertices.each do |k,v|
            add_neighbors(k,v,nodes)
        end
        vertices
    end

    def add_neighbors(k,v,nodes)
        moves = [[+2,+1], [+2,-1], [+1,+2], [+1,-2], [-1,+2], [-1,-2], [-2,+1], [-2,-1]]

        moves.each do |move|
            x = k.value[0] + move[0] 
            y = k.value[1] + move[1] # calculate possible moves
            
            neighbor = find_node(x,y,nodes)
            v << neighbor
        end 
        v.compact!
        v 
    end

    def find_node(value_1,value_2,nodes)

        i = 0
        while i < nodes.length 
            if !value_1.between?(1,8) || !value_2.between?(1,8) # exclude values that are off chess board
                return
            elsif nodes[i].value == [value_1,value_2]
                nodes[i]
                break
            else 
                i += 1
                next
            end
        end
        nodes[i]
    end

    def shortest_path(first,last)
        source_node = find_node(first[0],first[1],nodes)
        node_to_reach = find_node(last[0],last[1],nodes)

        queue = []
        source_node.distance = 0
        queue.push(source_node)

        while !queue.empty?

            vertices[queue[0]].each do |neighbor|
                if neighbor.distance.nil? # distance shows if a node has been visited
                    neighbor.predecessor = queue[0]
                    neighbor.distance = neighbor.predecessor.distance + 1
                else 
                    next
                end
            end
        end
    end



        

end

board = Chess_board.new([1,2,3,4,5,6,7,8])
board.shortest_path([1,1],[3,3])
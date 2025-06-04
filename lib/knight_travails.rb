require_relative 'board'
#Each instance should create the connections between the knight pos and the board
#Then, calculate the weight of the end pos

class KnightTravails

  def initialize(start,fin)
    @chess = Board.new(start)
    knight_moves(start,fin)
    puts "You're already here!" if start == fin
  end

  def generate_move(start) #Maybe move "start" to init
    # @chess.board[start[0]][start[1]] = "K" #Place Knight On board
    bounds = (0..7)
    abort ("Invalid Option") unless start.all?{ |n| bounds.include?(n)}

    #TODO - Refactor this code. This is ass. It works...but its ass
    moveset = [ #Calculated based on knights moveset on the created board
      (start[0] - 2), (start[0] - 1),
      (start[0] + 2), (start[0] + 1),
      (start[1] - 2), (start[1] - 1),
      (start[1] + 2), (start[1] + 1)
    ]

    move_cordinates = [ #Possible moves the knight can make
      [moveset[0],moveset[5]],[moveset[0],moveset[7]],
      [moveset[1],moveset[4]],[moveset[1],moveset[6]],
      [moveset[3],moveset[4]],[moveset[3],moveset[6]],
      [moveset[2],moveset[5]],[moveset[2],moveset[7]],
    ]

    move_cordinates.each do |r,c| #Generate all the in-bound moves on board
      @chess.board[r][c] = "M" if bounds.include?(r) &&  bounds.include?(c)
    end
  end

  def knight_moves(start,fin) #while start != fin
    generate_move(start) #Place knight on board find avaiable moves
    move_arr = []

    @chess.board.each_with_index do |r,r_in| #.index
      r.each_with_index do |c,c_in|
        move_arr << [r_in,c_in] if c == "M"
      end
    end
    p move_arr
    @chess.print_board
    p "SPLITT"
   @chess = Board.new(move_arr[0])
   generate_move(move_arr[0])
    # move_arr.each do |move|
    #   @chess = Board.new(move)
    #   @chess.print_board
    # end
    #TODO - Somehow make start = the move that was made
    #TODO - Then itereate (recursivly?) over all the possible moves and keep count, returing the lease resistance
    @chess.print_board
  end
end

play = KnightTravails.new([3,4],[0,0]) #[Letter,Number] - 0 to 7

# knight_moves([A,0],[B,2]) Should return the shortest path that the knight can take to go from A0 to B2
# knight_moves([A,0],[D,3]) Should return: A0->C1->D3
#[2,4]+[1,5] + K + [1,5]+[2,4]

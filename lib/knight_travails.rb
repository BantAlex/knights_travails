require_relative 'board'
#Each instance should create the connections between the knight pos and the board
#Then, calculate the weight of the end pos

class KnightTravails

  def initialize(start,fin)
    @chess = Board.new
    knight_moves(start,fin)
    print "You're already here!" if start == fin
  end

  def generate_move(start,fin) #Maybe move "start" to init
    @chess.board[start[0]][start[1]] = "K" #Place Knight On board
    bounds = (0..7)
    abort ("Invalid Option") unless start.all?{ |n| bounds.include?(n)}

    #TODO - Refactor this code. This is ass. It works...but its ass
    moveset = [
      (start[0] - 2), (start[0] - 1),
      (start[0] + 2), (start[0] + 1),
      (start[1] - 2), (start[1] - 1),
      (start[1] + 2), (start[1] + 1)
    ]

    #Find possible moves
    @chess.board[moveset[0]][moveset[5]] = "M" if bounds.include?(moveset[0]) &&  bounds.include?(moveset[5])
    @chess.board[moveset[0]][moveset[7]] = "M" if bounds.include?(moveset[0]) &&  bounds.include?(moveset[7])

    @chess.board[moveset[1]][moveset[4]] = "M" if bounds.include?(moveset[1]) &&  bounds.include?(moveset[4])
    @chess.board[moveset[1]][moveset[6]] = "M" if bounds.include?(moveset[1]) &&  bounds.include?(moveset[6])

    @chess.board[moveset[3]][moveset[4]] = "M" if bounds.include?(moveset[3]) &&  bounds.include?(moveset[4])
    @chess.board[moveset[3]][moveset[6]] = "M" if bounds.include?(moveset[3]) &&  bounds.include?(moveset[6])

    @chess.board[moveset[2]][moveset[5]] = "M" if bounds.include?(moveset[2]) &&  bounds.include?(moveset[5])
    @chess.board[moveset[2]][moveset[7]] = "M" if bounds.include?(moveset[2]) &&  bounds.include?(moveset[7])
    #?Maybe re-init when checking from next move
  end

  def knight_moves(start,fin) #while start != fin
    generate_move(start,fin)
    #TODO - Somehow make start = the move that was made
    #TODO - Itereate (recursivly?) over all the possible moves and keep count, returing the lease resistance
    @chess.print_board
  end
end

play = KnightTravails.new([0,0],[0,0]) #[Letter,Number] - 0 to 7

#Connections from D3: C1,E1,B2,F2,B4,F4,C5,E5
# knight_moves([A,0],[B,2]) Should return the shortest path that the knight can take to reach start A0 to B2:A0->B2
# knight_moves([A,0],[D,3]) Should return: A0->C1->D3
#[2,4]+[1,5] + K + [1,5]+[2,4]

class Board
  attr_accessor :board

  def initialize
    @board = [
    [nil,nil,nil,nil,nil,nil,nil,nil], #A=0
    [nil,nil,nil,nil,nil,nil,nil,nil], #B=1
    [nil,nil,nil,nil,nil,nil,nil,nil], #C=2
    [nil,nil,nil,nil,nil,nil,nil,nil], #D=3
    [nil,nil,nil,nil,nil,nil,nil,nil], #E=4
    [nil,nil,nil,nil,nil,nil,nil,nil], #F=5
    [nil,nil,nil,nil,nil,nil,nil,nil], #G=6
    [nil,nil,nil,nil,nil,nil,nil,nil]  #H=7
  ]
  @board
  end

  def print_board
    puts "A: #{board[0]}"
    puts "B: #{board[1]}"
    puts "C: #{board[2]}"
    puts "D: #{board[3]}"
    puts "E: #{board[4]}"
    puts "F: #{board[5]}"
    puts "G: #{board[6]}"
    puts "H: #{board[7]}"
  end
end

require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    p "-----------"
    p " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    p " #{@board[3]} | #{@board[0]} | #{@board[5]} "
    p " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(input)
  input.to_i - 1
end

def move(index, player = "X")
  @board[index]=player
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  
  (0..9).include?(index) && !position_taken?(index)

end

def turn_count
  @board.select {|i| i != " "}.length
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Choose a position"
  user_selection = gets
  index = input_to_index(user_selection)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    puts "Position not valid. Try again"
    turn
  end
  # is_valid = valid_move?(index)? move(index, current_player) : {puts "Position not valid. Try again"; turn}
end

def won?
  x_positions =[]
  o_positions = []
  @board.each_with_index do |game_piece, index|
    if game_piece == "X"
      x_positions << index
    elsif game_piece == "O"
      o_positions << index
    end
  end
  results = WIN_COMBINATIONS.select do |winning_array|
    if (winning_array-x_positions).empty? || (winning_array-o_positions).empty?
      true
    end
  end

  display_board
  results[0]
end

def full?
!@board.include?(" ")
end

def draw?
  full? ? won? ? false : true : false
end

def over?
  won? || full?
end

def winner
end

def play
end

end
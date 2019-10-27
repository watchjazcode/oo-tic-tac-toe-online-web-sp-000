class TicTacToe
=begin
#same as below
def initialize(board = nil)
  if board != nil
    @board = board
  else
    @board = Array.new(9, " ")
  end
end
=end
  def initialize(board = nil) #default is no board given
    @board = board || Array.new(9, " ")
    #if not given a board, we use new board.

  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
    move(index, current_player)
    display_board
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
=begin
#same as below
   def current_player
    remainder = turn_count % 2
    if remainder == 0
      return "X"
    else
      return "O"
    end
  end
=end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return nil
  end
  
  def full?
    @board.each do | board_cell |
      if board_cell == " " || board_cell == "" || board_cell == nil
        return false
      end
    end
    return true
  end
  
  def draw?
    if !won?
      if full?
        return true
      else
        return false
      end
    else 
      false
    end
  end
  
  def over?
    if full? || won? || draw?
      return true
    end
  end
  
  def winner
    result = won? # <= giving back winning pattern
    if result == nil 
      return nil
    else
      index = result[0] 
      return @board[index] 
    end
  end
  
  def play
    until over? # keep repeating until game is over
      turn
    end
    if won?
      winner_winner_chicken_dinner = won?
      if winner_winner_chicken_dinner == true
        puts "Congratulations"
      else
        character = @board[winner_winner_chicken_dinner[0]]
        puts "Congratulations #{character}!"
      end
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

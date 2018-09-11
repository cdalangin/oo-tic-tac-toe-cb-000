class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6] ]


  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index]=="X" || @board[index]== "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts = "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    combination = for combination in WIN_COMBINATIONS
    place_1 = @board[combination[0]]
    place_2 = @board[combination[1]]
    place_3 = @board[combination[2]]
    if place_1 == "X" && place_2 == "X" && place_3 == "X"
      return combination
    elsif place_1 == "O" && place_2 == "O" && place_3 == "O"
      return combination
    end
  end
  false
end

  def full?(index)
    if !(@board.include(" "))
  end

  def draw?
    full? && !won?
  end

  def over?
    if draw? || won? || full?
      true
    elsif !full
      false
    end
  end

end

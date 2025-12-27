require 'io/console'

class Board
  def initialize
    @positions = (0..8).to_a
    @player1 = "Player1"
    @player2 = "Player2"
  end

  def print_board
    # create, center, and pint board
    width = IO.console.winsize[1]
    board = [
      "     ",
      "#{@player1}       #{@player2}",
      "     ",
      "#{@positions[0]}|#{@positions[1]}|#{@positions[2]}",
      "-|-|-",
      "#{@positions[3]}|#{@positions[4]}|#{@positions[5]}",
     "-|-|-",
      "#{@positions[6]}|#{@positions[7]}|#{@positions[8]}"
    ]
    board.map! { |line| line.center(width) }
    puts board
  end

  def update_board(position, mark)
    #change board positions
    if position >= 0 && position <= 8
      unless @positions[position] == "x" || @positions[position] == "o"
        @positions[position] = mark
        return false
      else
        puts "That position is already occupied"
        return true
      end
    else 
      puts "This input is not a number between 0 and 8"
      return true
    end
  end

  def board1_name(name)
    @player1 = name
  end

  def board2_name(name)
    @player2 = name
  end

  def board_reset
    @positions = (0..8).to_a
  end

  def get_positions
    @positions
  end
end

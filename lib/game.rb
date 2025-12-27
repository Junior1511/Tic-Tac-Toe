require_relative 'board'
require_relative 'player'

class Game

  def initialize
    @board = Board.new()
    @players = Player.new
    @done = false
  end
  
  def who_wins
    winning_combos = [
    [0,1,2], [3,4,5], [6,7,8], # horizontal
    [0,3,6], [1,4,7], [2,5,8], # vertical
    [0,4,8], [2,4,6]  # diagonals 
    ]
    winning_combos.each do |combos|
      if @board.get_positions[combos[0]] == @players.p1_mark && @board.get_positions[combos[1]] == @players.p1_mark && @board.get_positions[combos[2]] == @players.p1_mark
        @done = true
        puts "#{@players.p1_name} is the Winner!"
      elsif @board.get_positions[combos[0]] == @players.p2_mark && @board.get_positions[combos[1]] == @players.p2_mark && @board.get_positions[combos[2]] == @players.p2_mark
        @done = true
        puts "#{@players.p2_name} is the Winner!"
      end
    end

    if @board.get_positions.all?{|num| num.is_a?(String)}
      puts "its a draw!"
      @done = true
    end
    
    false

  end
  
  def taking_turns
    until @done == true
      puts "#{@players.p1_name} pick a place on the board" #player one's turn
      until @board.update_board(gets.chomp.to_i, @players.p1_mark) == false
        puts "#{@players.p1_name} pick a different place on the board"
        @board.update_board(gets.chomp.to_i, @players.p1_mark)
      end
      @board.print_board
      self.who_wins
      break if @done == true
      puts "#{@players.p2_name} pick a place on the board" #player two's turn
      until @board.update_board(gets.chomp.to_i, @players.p2_mark)  == false
        puts "#{@players.p2_name} pick a different place on the board"
        @board.update_board(gets.chomp.to_i, @players.p2_mark)
      end
      @board.print_board
      self.who_wins
    end
  end

  
  def repeat_n_reset
    answer = nil
    until answer.downcase == "y" || answer.downcase == "n"
      puts "Do you wanna play again?"
      puts "Type Y or N to continue"
      answer = gets.chomp
      if answer.downcase == "y"
        @board.board_reset
        self.play_wo_reset
      elsif answer.downcase == "n"
        puts "The Game is gone. G_Gs"
      else 
        puts "You did not type Y or N"
      end
    end
  end
  
  def play
    @board.board1_name(@players.p1_name)
    @board.board2_name(@players.p2_name)
    @board.print_board
    taking_turns
    repeat_n_reset
  end

end

dude = Game.new()
dude.play


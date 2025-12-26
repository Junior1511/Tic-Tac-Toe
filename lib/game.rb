require_relative 'board'
require_relative 'player'

class Game

  def initialize
    @board = Board.new()
    # @p1 = nil
    # @p2 = nil
    # set_players
    taking_turns
  end

  def set_players
    puts "Hello player 1, what is your name?"
    p1_n = gets.chomp
    puts "what mark do you want to use, X or O?"
    p1_m = gets.chomp
    @p1 = Player.new(p1_n,p1_m)
    @board.board1_name(@p1.name)
    @board.print_board
    
    puts "Hello player 2, what is your name?"
    p2_n = gets.chomp
    if p1_m == "x"
      p2_m = "o"
    else
      p2_m = "x"
    end
    @p2 = Player.new(p2_n,p2_m)
    @board.board2_name(@p2.name)
    @board.print_board
  end

  
  def who_wins
    winning_combos = [
    [0,1,2], [3,4,5], [6,7,8], # horizontal
    [0,3,6], [1,4,7], [2,5,8], # vertical
    [0,4,8], [2,4,6]  # diagonals 
    ]
    winning_combos.each do |combos|
      if @board.get_positions[combos[0]] == @p1.mark && @board.get_positions[combos[1]] == @p1.mark && @board.get_positions[combos[2]] == @p1.mark
        puts "#{@p1.name} is the Winner!"
      elsif @board.get_positions[combos[0]] == @p2.mark && @board.get_positions[combos[1]] == @p2.mark && @board.get_positions[combos[2]] == @p2.mark
        puts "#{@p2.name} is the Winner!"
      end
    end

    if @board.get_positions.all?{|num| num.is_a?(String)}
      puts "its a draw!"
    end
    
    false

  end
  
  def taking_turns
    
  end
end

dude = Game.new()
dude.who_wins


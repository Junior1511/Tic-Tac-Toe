class Player

  attr_accessor :p1_name, :p2_name, :p1_mark, :p2_mark

  def initialize()
    @p1_name = nil
    @p1_mark = nil
    @p2_name = nil
    @p2_mark = nil
    set_player_1
    set_player_2
  end

  def set_player_1
    puts "Hello Player 1 what is your name?"
    @p1_name = gets.chomp
    puts "Would you like to keep your name as #{@p1_name}"
    puts "Press Y or N to continue"
    answer = gets.chomp
    until answer.downcase == "y"
     puts "Type your new name in ..."
     @p1_name = gets.chomp
     puts "Press Y or N to continue"
     answer = gets.chomp
    end
    puts "what mark do you want to use, X or O?"
    @p1_mark = gets.chomp
    until @p1_mark.downcase == "x" || @p1_mark.downcase == "o"
     puts "You typed #{@p1_mark}, you need a new mark"
     puts "Please type it"
     @p1_mark = gets.chomp
    end
  end

  def set_player_2
    puts "Hello Player 2 what is your name?"
    @p2_name = gets.chomp
    puts "Would you like to keep your name as #{@p2_name}"
    puts "Press Y or N to continue"
    answer = gets.chomp
    until answer.downcase == "y"
     puts "Type your new name in ..."
     @p2_name = gets.chomp
     puts "Press Y or N to continue"
     answer = gets.chomp
    end
    puts "what mark do you want to use, X or O?"
    @p2_mark = gets.chomp
    until (@p2_mark.downcase == "x" && @p2_mark != @p1_mark) || (@p2_mark.downcase == "o" && @p2_mark != @p1_mark)
     puts "You typed #{@p2_mark}, you need a new mark"
     puts "Please type it"
     @p2_mark = gets.chomp
    end
  end

  
end

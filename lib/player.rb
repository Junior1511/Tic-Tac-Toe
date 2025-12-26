class Player

  attr_accessor :name, :mark

  def initialize(name,mark)
    if mark.downcase == "o" || mark.downcase == "x"
      @name = name
      @mark = mark.downcase
    else
      puts "Player mark is wrong!"
      puts "Player should pick between X or O"
    end
  end

  
end

class Player
  attr_accessor :name, :won, :lost, :tie

  def initialize(name)
    self.name = name
    
  end 

  private
  def codes
    @codeWon = 1
    @codeLost = 2
    @codeTie = 3
  end
  def won
    @won = 0
  end
  def lost
    @lost = 0
  end
  def tie
    @tie = 0
  end

  public 

  def name=(nameNew)
    @name = nameNew
  
  end

  def changeStats(code)
    if code == @codeWon
      @won += 1
    elsif code == @codeLost
      @lost += 1
    elsif code == @codeTie
      @tie += 1
    else
      puts "Access denied"
    end
  end

  def seeStats
    puts "You won #{@won} games."
    puts "You lost #{@lost} games."
    puts "You ties in #{@tie} games."
  end

end

ha = Player.new("Hohoshka")
pp ha.name
ha.seeStats
ha.changeStats(1)
ha.seeStats

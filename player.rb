class Player
  attr_accessor :name, :won, :lost, :tie

  def initialize(name, won=0, lost=0, tie=0)
    self.name = name
    @won = won
    @lost = lost
    @tie = tie
    
  end 

  private
  def codeWon
    @codeWon = 1
  end
  def codeLost
    @codeLost = 2
  end
  def codeTie
    @codeTie = 3
  end
  

  public 

  def name=(nameNew)
    @name = nameNew
  
  end

  def changeStats(code)
    if code == codeWon
      @won += 1
    elsif code == codeLost
      @lost += 1
    elsif code == codeTie
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

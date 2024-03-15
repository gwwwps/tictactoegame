#file with algorithm for the "Against computer" mode
#The computer will use O, player - X


arrayVote = []
9.times { arrayVote.push(0) }




def compAl(arrayGame, winningCombs)
=begin
  attr_accessor = :arrayGame

  def initialize(arrayGame)
    self.arrayGame = arrayGame
  end
=end
  playerWin = closeToWin(arrayGame, winningCombs)
  if playerWin != false
    return playerWin
  end


end



def closeToWin(arrayOne, wc) #Checks if the player is about to win
  closeCall = 0
  wc.each {|y|
    y.each{ |z|
      if arrayOne[z] == "X"
        closeCall += 1
      elsif arrayOne[z] == "O"
        closeCall -= 1
      end

    }
    if closeCall == 2
      y.each{ |z|
        return z if arrayOne[z] != "X"
      }
    end
    closeCall = 0
  }
  

  return false
end

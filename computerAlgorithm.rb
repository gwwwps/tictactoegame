#file with algorithm for the "Against computer" mode
#The computer will use "O", player - "X"







def compAl(arrayGame, winningCombs)
=begin
  attr_accessor = :arrayGame

  def initialize(arrayGame)
    self.arrayGame = arrayGame
  end
=end
  playerWin = closeToWin(arrayGame, winningCombs)
  comnuterMove = chooseTheMove(arrayGame, winningCombs)
  if playerWin != false
    return playerWin
  else
    return comnuterMove
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



def chooseTheMove(array, winArray) #Chooses the best move for a computer
  arrayVote = []
  9.times { arrayVote.push(0) }
  for i in 0..8
    if array[i] == "X" || array[i] == "O"
      arrayVote[i] = -100
    end

    winArray.each { |x|
      arrayVote[i] += 1 if x.include? i
      arrayVote[i] += 1 if x.include? "O"
      arrayVote[i] -= 1 if x.include? "X"
    }

  end
  arrayVote = checkTwoOs(winArray, arrayVote, array)
  bestMove = checkTheBiggest(arrayVote)
  return bestMove

end

def checkTwoOs(wc, av, a) #checks if computer is close to winning
  counter = 0
  wc.each { |x|
    x.each {|y|
      counter += 1 if a[y] == "O"
      counter -= 1 if a[y] == "X"
    }
    if counter == 2
      x.each { |y|
        av[y] += 50 if a[y] != "O"
      }
    end
    counter = 0
  }
  return av
end

def checkTheBiggest(array) #finds the position in the array with the biggst value
  bestPosition = 0
  for i in 1..8
      if array[i] > array[bestPosition] 
        bestPosition = i
      end
  end
  return bestPosition

end

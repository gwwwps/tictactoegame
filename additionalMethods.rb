#Small methods for the game

def integer_check(num)
  #attr_accessor = :num

  #fef.initial

  if num.to_i.to_s != num
    return false
  end
end

def checkIfWon (array, winArray, modeC, po, pt) #check if somebody already won
  countP = 0
  countC = 0
  whoWon = ""
  winArray.each {|x|
    x.each {|y|
      if array[y] == "X"
        countP += 1
      elsif array[y] == "O"
        countC += 1
      end
    }
    return "You" if countP == 3 && modeC == 1
    return "Computer" if countC == 3 && modeC == 1
    return po if countP == 3 && modeC == 2
    return pt if countC == 3 && modeC == 2
    countP = countC = 0
  }
  return false
end

def checkIfTaken(array, num)
  if array[num - 1] == "X" || array[num - 1] == "O"
    return true
  end
end

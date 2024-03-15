# the main file for the game
require "./computerAlgorithm.rb"
require "./additionalMethods.rb"

defValue = [1, 2, 3, 4, 5, 6, 7, 8, 9]

positions = defValue #positions to be printed out on grid

winningCombs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
#The values above are positions in the array, not on the actual grid

phase = 1 
=begin
phases of the game. 
1 - chosing the mode
2 - player move(against computer)
3 - computer move
4 - results screen
=end

takenPosCounter = 0




while true
  puts "#{positions[0]}---#{positions[1]}---#{positions[2]}\n#{positions[3]}---#{positions[4]}---#{positions[5]}\n#{positions[6]}---#{positions[7]}---#{positions[8]}"
  


  if checkIfWon(positions, winningCombs) != false || (takenPosCounter == 9 && checkIfWon(positions, winningCombs) == false)
    if takenPosCounter == 9 && checkIfWon(positions, winningCombs) == false
      puts "It's a tie!"
    else
      puts "#{checkIfWon(positions, winningCombs)} won!"
    end
    puts "Press enter to continue."
    takenPosCounter = 0
    ent = gets
    positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    phase = 1
  end

  if phase == 1
    puts "By Ian Ishenin"
    puts "Welcome to the TIcTacToe!\nTo start, choose the mode."
    modeChoose = gets.chomp!
    phase = 2

  elsif phase == 2
    print "Enter a number on the field you want to fill: "
    playerMove = gets.chomp!
    puts ""
    if playerMove.downcase == "stop"
      phase = 1 
      positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
    next if playerMove.downcase == "stop"
    
    

    while true
      if playerMove.downcase == "stop" 
        phase = 1 
        positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        break
      elsif integer_check(playerMove) == false || playerMove.to_i > 9 || playerMove.to_i < 1
        puts "Invalid entry. Type in number between 1 and 9(inclusive)."
      elsif checkIfTaken(positions, playerMove.to_i)
        puts "This position is already filled in! Choose another position."
      
      else
        break
      end
      print "Enter a number on the field you want to fill: "
      playerMove = gets.chomp!
      puts ""
      
    end 
    next if playerMove.downcase == "stop"

    positions[playerMove.to_i - 1] = "X"
    takenPosCounter += 1
    phase = 3

  elsif phase == 3
    positions[compAl(positions, winningCombs)] = "O"
    takenPosCounter += 1
    phase = 2
  end  
end

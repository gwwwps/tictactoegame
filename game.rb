# the main file for the game
require "./computerAlgorithm.rb"
require "./additionalMethods.rb"
require "./player.rb"

puts "By Ian Ishenin"

positions = [1, 2, 3, 4, 5, 6, 7, 8, 9] #positions to be printed out on grid

winningCombs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
#The values above are positions in the array, not on the actual grid

phase = 1 
=begin
phases of the game. 
1 - chosing the mode
2 - player move(against computer)
3 - computer move
4 - choosing name for player2
5 - player1 move(against player)
6 - player2 move
7 - check stats screen
=end

mode = 0

takenPosCounter = 0 #counts the filled positions on the field. If the number reaches 9 and nobody won the game stops

# randPhase [5, 6] #to randomly choose who is going first

namesHash = Hash.new




puts "Welcome to the game of TicTacToe"
print "Enter your username to start: "
namePO = gets.chomp!
namesHash[namePO.to_sym] = Player.new(namePO)
namePT = ""

""
#----------------------------------------------------------------------
while true
  puts "#{positions[0]}---#{positions[1]}---#{positions[2]}\n#{positions[3]}---#{positions[4]}---#{positions[5]}\n#{positions[6]}---#{positions[7]}---#{positions[8]}"
  


  if checkIfWon(positions, winningCombs, mode, namePO, namePT) != false || (takenPosCounter == 9 && checkIfWon(positions, winningCombs, mode, namePO, namePT) == false)
    if takenPosCounter == 9 && checkIfWon(positions, winningCombs, mode, namePO, namePT) == false
      puts "It's a tie!"
    else
      puts "#{checkIfWon(positions, winningCombs, mode, namePO, namePT)} won!"
    end
    puts "Press enter to continue."
    takenPosCounter = 0
    ent = gets
    positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    phase = 1
  end

#----------------------------------------------------------------------

  if phase == 1 # phase1 - main screen
    
    puts "Welcome to the TicTacToe!\nTo start, choose the mode. Enter the number of the mode that you want to choose.\n"
    print "1 - Against Computer\n2 - Against player\n3 - See player's statistics\nEnter your choice: "
    modeChoose = gets.chomp!
    puts ""
    while modeChoose != "1" && modeChoose != "2" && modeChoose != "3"
      puts "Invalid choice! Enter a number between 1 and 3(inclusive) to choose the mode."
      modeChoose = gets.chomp!
    end

    if modeChoose == "1" #agaist computer
      phase = 2
      mode = 1
    elsif modeChoose == "2" #against player
      phase = 4
      mode = 2
    elsif modeChoose == "3" #stats screen
      phase = 7
    end

#----------------------------------------------------------------------

  elsif phase == 2 # phase2 - player's move
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
    puts ""
    phase = 3

#----------------------------------------------------------------------

  elsif phase == 3 # phase3 - computer's move
    positions[compAl(positions, winningCombs)] = "O"
    takenPosCounter += 1
    phase = 2

#----------------------------------------------------------------------

  elsif phase == 4 # phase4 - to add new player
    print "Enter the username of the second player: "
    namePT = gets.chomp!
    puts ""

    if namePT == namePO
      puts "This is a username of the first player!\nEnter a different username: "
      namePT = gets.chomp!
    end
    if namesHash.include?(namePT.to_sym) == false
      namesHash[namePT.to_sym] = Player.new(namePT)
    end
    puts "#{namePO} will have X's, #{namePT} will have O's."
    phase = rand(5..6)

#----------------------------------------------------------------------

  elsif phase == 5 #phase5 - player1 move
    puts "#{namePO}'s move."
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
    puts ""
    phase = 6

#----------------------------------------------------------------------

  elsif phase == 6 #phase6 - player2 move
    puts "#{namePT}'s move."
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

    positions[playerMove.to_i - 1] = "O"
    takenPosCounter += 1
    puts ""
    phase = 5
#----------------------------------------------------------------------

  elsif phase == 7 #phase7 - checking statistics

  end  
#----------------------------------------------------------------------
  
end

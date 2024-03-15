# the main file for the game
require "./computerAlgorithm.rb"
require "./additionalMethods.rb"

positions = ["O", "O", 3, 4, 5, 6, 7, 8, 9] #positions to be printed out on grid

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


puts "Welcome to the TIcTacToe!\nTo start, choose the mode."

positions[compAl(positions, winningCombs)] = "O"

puts "#{positions[0]}---#{positions[1]}---#{positions[2]}\n#{positions[3]}---#{positions[4]}---#{positions[5]}\n#{positions[6]}---#{positions[7]}---#{positions[8]}"
print "Enter a number on the field to fill: "
puts ""


a = "a"
if integer_check(a) == false
  pp "NO"
end

# the main file for the game
require "./computerAlgorithm.rb"
require "./additionalMethods.rb"

positions = ["X", 2, "X", 4, 5, 6, 7, 8, 9]

winningCombs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
#The values above are positions in the array, not on the actual grid

puts "Welcome to the TIcTacToe!\nTo start, choose the mode."

positions[compAl(positions, winningCombs)] = "O"

puts "#{positions[0]}---#{positions[1]}---#{positions[2]}\n#{positions[3]}---#{positions[4]}---#{positions[5]}\n#{positions[6]}---#{positions[7]}---#{positions[8]}"
print "Enter a number on the field to fill: "
puts ""


a = "a"
if integer_check(a) == false
  pp "NO"
end


pp positions

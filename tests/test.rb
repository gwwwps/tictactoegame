require "./player.rb"
require "./additionalMethods.rb"

print "A"
nameN = gets.chomp!
namesHash = Hash.new
namesHash[nameN.to_sym] = Player.new(nameN)
pp namesHash[nameN.to_sym].name


puts ""
ha = Player.new("Hohoshka")
pp ha.name
ha.seeStats
ha.changeStats(1)
ha.seeStats

pp "a"
c = gets.chomp!

clear_comman_line

pp "b"

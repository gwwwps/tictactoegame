require "minitest/autorun"
require "./computerAlgorithm.rb"



class TestComputer < Minitest::Test
  #testArray = [1, 2, 3, "O", 5, "O", 7, 8, 9]
  #winningCombs = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  def test_move
    assert_equal 4, compAl([1, 2, 3, "O", 5, "O", 7, 8, 9], [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]), "Choosing move method failed."
  end
end

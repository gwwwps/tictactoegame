require "minitest/autorun"
require "./additionalMethods.rb"

class TestCheckWin < Minitest::Test

  def test_win
    assert_equal "Computer", checkIfWon([1, 2, 3, "O", "O", "O", 7, 8, 9], [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]], 1, "lol", "nn")

    assert_equal "lol", checkIfWon([1, 2, 3, "X", "X", "X", 7, 8, 9], [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]], 1, "lol", "nn")

    assert_equal false, checkIfWon([1, 2, 3, "X", 5, "X", 7, 8, 9], [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]], 1, "lol", "nn")

    assert_equal "nn", checkIfWon([1, 2, 3, "O", "O", "O", 7, 8, 9], [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]], 2, "lol", "nn")
  end
end

# ruby-cli-template

Use this repository as a template for your Ruby CLI (command line interface) project.

- Ruby version: `3.2.1`

This is the game of tictactoe
To start, run game.rb

The game starts by entering the username of Player1, or just your name. 
There are two invalid names: 
"stop" in any form - reserved for a command to come back in main menu at any point of the game
"no_name_player_pppppppppppppppppppppppp" - reserved for a computer

The name that you entered will be stored and then can be used to access players stats. CASE MATTERS

Then you choose the mode that you want to play.
To choose a mode you have to enter the number provided
When you choose a mode you enter a new phase. Each phase represents different menu or move. The meaning of each phase:

1 - chosing the mode
2 - player move(against computer)
3 - computer move
4 - choosing name for player2
5 - player1 move(against player)
6 - player2 move
7 - check stats screen

---------------------------------------------------------------------------------------------------------------------------

Against computer: 

Player will have X's, computer will have O's

In this mode you will play against computer algorithm. The algorithm chooses the position with the most amount of posiibilities to win. However, if the player is about to win(has 2 X's out of 3), the computer will choose a move to stop player from winning EVEN if the computer himself is about to win. 

In this mode, just like in "Against player" you will have to enter valid number between 1 and 9 (inclusive), otherwise it will ask you to put a different entry until you put in a valid one.

The field will be shown at the top of the console and will update after each move and set to default after the end of the game.


Before every phase the algorithm checks if somebody has won. If there are 3 X's in a row, or there are 3 O's in the row, the game will stop and show the results. If all the positions are filled but nobody won it's a tie.


---------------------------------------------------------------------------------------------------------------------------

Against player

In this mode you will have to enter a name of the second player. If the player in already stored in the namesHash, than the Player with this name will be used. Otherwise a new Player will be created. 

Player1 will have X's, Player2 will have O's
The choice of who is going first is randomized. 

The process is the same, but an additional move is added for the second player. The program will show who's turn it is by typing it below the field. 

----------------------------------------------------------------------------------------------------------------------------

Check stats

In this menu you will be able to see the history of your games; amount of wins, losses and ties

To check the stats, you will have to enter the name of the player you want to check. If the Player with such name doesn't exist yet, the program will ask for a different name. 

The results are updated for each player after each game. The results can be updated only by the program and only at the end of the game and only via special code(which are easy to guess haha). 

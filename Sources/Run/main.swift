import App
import Foundation

/// chess game created.
var game = ChessGame()

/// Waiting for player's move.
var playerMove: String

print("\n")
/// Runs main Application.
while !game.checkMate {
    print(game.display)
    playerMove = readLine()!
    print("White's Move is \(playerMove)")
    game.getCommandInfo(playerMove, Turn.whiteTurn)
    print("\n")

    print(game.display)
    playerMove = readLine()!
    print("Black's Move is \(playerMove)")
    game.getCommandInfo(playerMove, Turn.blackTurn)
    print("\n")
}

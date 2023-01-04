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
    print("Player's Move is \(playerMove)")
    print("\n")
}

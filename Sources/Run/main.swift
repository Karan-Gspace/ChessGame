import App
import Foundation

/// chess game created.
var game = Game()

/// Waiting for player's move.
var playerMove: String

/// Runs main Application.
while !game.checkMate {
    print(game.display)
    playerMove = readLine()!
    print("Player's Move is \(playerMove)")
}

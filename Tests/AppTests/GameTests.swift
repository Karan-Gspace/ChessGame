import XCTest

@testable import App

import class Foundation.Bundle

/// Tests for the Game Board.
final class GameTests: XCTestCase {

    /// Test Initializer
    func testInit() throws {
        let gameTest = Game()
        let board = [
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"]
        ]
        XCTAssertEqual(gameTest.board, board)
    }

    /// Tests Equality.
    func testEquality() throws {
        let gameTest = Game()
        var gameTest2 = Game()
        XCTAssertEqual(gameTest.board, gameTest2.board)
        XCTAssertEqual(gameTest.display, gameTest2.display)
        gameTest2.board[0][1] = "X"
        XCTAssertNotEqual(gameTest.board, gameTest2.board)
        XCTAssertNotEqual(gameTest.display, gameTest2.display)
    }

    /// Tests Getters and Setters.
    func testGettersAndSetters() throws {
        var gameTest = Game()
        let board = [
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"]
        ]
        let display = String(repeating: "_ _ _ _ _ _ _ _\n", count: 8)
        XCTAssertEqual(gameTest.board, board)
        XCTAssertEqual(gameTest.display, display)
        let newBoard = [
            ["X", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"]
        ]
        let newDisplay = "X _ _ _ _ _ _ _\n" + String(repeating: "_ _ _ _ _ _ _ _\n", count: 7)
        gameTest.board[0][0] = "X"
        XCTAssertEqual(gameTest.board, newBoard)
        XCTAssertEqual(gameTest.display, newDisplay)
    }
 
}

import XCTest

@testable import App

import class Foundation.Bundle

/// Tests for the Game Board.
final class GameTests: XCTestCase {

    /// Test Initializer
    func testInit() throws {
        let gameTest = ChessGame()
        let board = [
            ["r", "k", "b", "Q", "K", "b", "k", "r"],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["r", "k", "b", "Q", "K", "b", "k", "r"]
        ]
        XCTAssertEqual(gameTest.board, board)
        XCTAssertFalse(gameTest.check)
        XCTAssertFalse(gameTest.checkMate)
    }

    /// Tests Equality.
    func testEquality() throws {
        let gameTest = ChessGame()
        var gameTest2 = ChessGame()
        XCTAssertEqual(gameTest.board, gameTest2.board)
        XCTAssertEqual(gameTest.display, gameTest2.display)
        XCTAssertEqual(gameTest.checkMate, gameTest2.checkMate)
        XCTAssertEqual(gameTest.check, gameTest2.check)
        gameTest2.board[0][1] = "X"
        gameTest2.checkMate = true
        gameTest2.check = true
        XCTAssertNotEqual(gameTest.board, gameTest2.board)
        XCTAssertNotEqual(gameTest.display, gameTest2.display)
        XCTAssertNotEqual(gameTest.checkMate, gameTest2.checkMate)
        XCTAssertNotEqual(gameTest.check, gameTest2.check)
    }

    /// Tests Getters and Setters.
    func testGettersAndSetters() throws {
        var gameTest = ChessGame()
        let board = [
            ["r", "k", "b", "Q", "K", "b", "k", "r"],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["r", "k", "b", "Q", "K", "b", "k", "r"]
        ]
        let display = "r k b Q K b k r\n" + "p p p p p p p p\n"
        + String(repeating: "_ _ _ _ _ _ _ _\n", count: 4)
        + "p p p p p p p p\n" + "r k b Q K b k r\n"
        XCTAssertEqual(gameTest.board, board)
        XCTAssertEqual(gameTest.display, display)
        XCTAssertFalse(gameTest.checkMate)
        XCTAssertFalse(gameTest.check)
        let newBoard = [
            ["X", "k", "b", "Q", "K", "b", "k", "r"],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["r", "k", "b", "Q", "K", "b", "k", "r"]
        ]
        let newDisplay = "X k b Q K b k r\n" + "p p p p p p p p\n"
        + String(repeating: "_ _ _ _ _ _ _ _\n", count: 4)
        + "p p p p p p p p\n" + "r k b Q K b k r\n"
        gameTest.board[0][0] = "X"
        gameTest.checkMate = true
        gameTest.check = true
        XCTAssertEqual(gameTest.board, newBoard)
        XCTAssertEqual(gameTest.display, newDisplay)
        XCTAssertTrue(gameTest.check)
        XCTAssertTrue(gameTest.checkMate)
    }
 
}

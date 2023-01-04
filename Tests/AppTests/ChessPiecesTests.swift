import XCTest

@testable import App

import class Foundation.Bundle

/// Tests for the Chess Pieces.
final class ChessPiecesTests: XCTestCase {

    /// Test init.
    func testInit() throws {
        let knightTest = ChessPiece(
            name: .knight,
            colour: .black,
            tag: ChessPiece.ChessPieceType.knight.rawValue,
            currentPosition: Position(0, 0)
        )
        XCTAssertEqual(knightTest.name, .knight)
        XCTAssertEqual(knightTest.colour, .black)
        XCTAssertEqual(knightTest.tag, "k")
        XCTAssertEqual(knightTest.currentPosition.x, 0)
        XCTAssertEqual(knightTest.currentPosition.y, 0)
    }

    /// Test Equality.
    func testEquality() throws {
        let piece1 = ChessPiece(
            name: .knight,
            colour: .black,
            tag: ChessPiece.ChessPieceType.knight.rawValue,
            currentPosition: Position(0, 0)
        )
        var piece2 = ChessPiece(
            name: .knight,
            colour: .black,
            tag: ChessPiece.ChessPieceType.knight.rawValue,
            currentPosition: Position(0, 0)
        )
        XCTAssertEqual(piece1.name, piece2.name)
        XCTAssertEqual(piece1.colour, piece2.colour)
        XCTAssertEqual(piece1.currentPosition.x, piece2.currentPosition.x)
        XCTAssertEqual(piece1.currentPosition.y, piece2.currentPosition.y)
        XCTAssertEqual(piece1.tag, piece2.tag)
        XCTAssertEqual(piece1.validMoves, piece2.validMoves)
        piece2 = ChessPiece(
            name: .bishop,
            colour: .white,
            tag: ChessPiece.ChessPieceType.bishop.rawValue,
            validMoves: [Position(1, 1)],
            currentPosition: Position(1, 1)
        )
        XCTAssertNotEqual(piece1.name, piece2.name)
        XCTAssertNotEqual(piece1.colour, piece2.colour)
        XCTAssertNotEqual(piece1.currentPosition.x, piece2.currentPosition.x)
        XCTAssertNotEqual(piece1.currentPosition.y, piece2.currentPosition.y)
        XCTAssertNotEqual(piece1.tag, piece2.tag)
        XCTAssertNotEqual(piece1.validMoves, piece2.validMoves)
    }

    /// Test getters and setters.
    func testGettersAndSetters() throws {}

}

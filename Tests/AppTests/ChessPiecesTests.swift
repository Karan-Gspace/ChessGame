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
    func testEquality() throws {}

    /// Test getters and setters.
    func testGettersAndSetters() throws {}

}

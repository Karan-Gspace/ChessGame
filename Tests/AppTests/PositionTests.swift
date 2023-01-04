import XCTest

@testable import App

import class Foundation.Bundle

/// Tests for the Chess Pieces.
final class PositionTests: XCTestCase {

    /// Test init.
    func testInit() throws {
        let position = Position(0, 0)
        XCTAssertEqual(position.x, 0)
        XCTAssertEqual(position.y, 0)
    }

    /// Test Equality.
    func testEquality() throws {
        let position1 = Position(0, 0)
        var position2 = Position(0, 0)
        XCTAssertEqual(position1.x, position2.x)
        XCTAssertEqual(position1.y, position2.y)
        position2.x = 1
        position2.y = 1
        XCTAssertNotEqual(position1.x, position2.x)
        XCTAssertNotEqual(position1.y, position2.y)
    }

    /// Test getters and setters.
    func testGettersAndSetters() throws {
        let xInput = 0
        let yInput = 0
        var position = Position(0, 0)
        XCTAssertEqual(position.x, xInput)
        XCTAssertEqual(position.y, yInput)
        let newXInput = 1
        let newYInput = 1
        XCTAssertNotEqual(position.x, newXInput)
        XCTAssertNotEqual(position.y, newYInput)
        position.x = newXInput
        position.y = newYInput
        XCTAssertEqual(position.x, newXInput)
        XCTAssertEqual(position.y, newYInput)
    }

}

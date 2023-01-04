import Foundation
/// The chess board is responsible for keeping track of pieces left standing and
/// pieces removed off the board.
///
/// Chess is a game played for thousands of years on an 8x8 grid board. Pieces
/// move throughout the board by two oponents, black and white. The GameBoard
/// contains a board matrix for monitoring the active pieces on the chess board.
/// The GameBoard also contains pieces in the graveyard for inactive pieces.
public struct ChessGame {

    /// Definition of the 8 x 8 chess board containing active pieces.
    public var board: [[String]]

    /// Defintion of a checkmate.
    public var checkMate = false

    /// Definition of a check.
    public var check = false

    /// Displays the current state of the chess board.
    public var display: String {
        var displayBoard = ""
        for row in self.board {
            var displayRow = ""
            displayRow += row[0]
            for square in row[1..<row.endIndex - 1] {
                displayRow += " " + square
            }
        displayRow += " \(row[board.endIndex - 1])\n"
        displayBoard += displayRow
        }
        return displayBoard
    }

    /// Definition of the array containing inactive pieces.
    private var graveyard: [ChessPiece] = []

    private let alphabetToNum: [String: Int]
    = [
        "a": 0,
        "b": 1,
        "c": 2,
        "e": 3,
        "f": 4,
        "g": 5,
        "h": 6,
        "i": 7
    ]

    /// Creates a new Chess Game.
    public init() {
        /// Definition of the 8 x 8 chess board containing active pieces.
        self.board = [
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"],
            ["_", "_", "_", "_", "_", "_", "_", "_"]
        ]
        let whiteArmy = createArmy(.white)
        let blackArmy = createArmy(.black)
        insertArmiesOntoBoard(whiteArmy, blackArmy)
    }

    /// Move chess piece on the board function.
    ///
    /// - Parameter playerInput: 
    public func move(_ playerInput: String) {
        let start = playerInput.startIndex
        let firstBreak = playerInput.index(start, offsetBy: 3)
        let secondBreak = playerInput.index(start, offsetBy: 5)
        let command = playerInput[start]
        let source = String(playerInput[playerInput.index(after: start)..<firstBreak])
        let destination = String(playerInput[secondBreak...])


    }

    private func convertAlphabetToCoordinates(inputPosition: String) -> Position {
        let xCoord = alphabetToNum[String(inputPosition[inputPosition.startIndex])]
        let yCoord = Int(String(inputPosition[inputPosition.index(after: inputPosition.startIndex)]))
        return Position(xCoord!, yCoord!)
    }

    private func createArmy(_ colour: PlayerColour) -> [ChessPiece] {
        var army: [ChessPiece] = []
        let king = ChessPiece.createKing(colour: colour)
        let queen = ChessPiece.createQueen(colour: colour)
        let bishops = ChessPiece.createBishops(colour: colour)
        let knights = ChessPiece.createKnights(colour: colour)
        let rooks = ChessPiece.createRooks(colour: colour)
        let pawns = ChessPiece.createPawns(colour: colour)
        army.append(king)
        army.append(queen)
        army.append(contentsOf: bishops)
        army.append(contentsOf: knights)
        army.append(contentsOf: rooks)
        army.append(contentsOf: pawns)
        return army
    }

    private mutating func insertArmiesOntoBoard(
        _ whiteArmy: [ChessPiece],
        _ blackArmy: [ChessPiece]
        ) {
        for piece in whiteArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
        }
        for piece in blackArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
        }
    }

}

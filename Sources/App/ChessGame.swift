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

    /// Definition of white army active pieces.
    private var whiteArmy: [ChessPiece] = []

    /// Definition of black army active pieces.
    private var blackArmy: [ChessPiece] = []

    /// Definition of the user input from alphabets to integers.
    private let alphabetToNum: [String: Int]
    = [
        "a": 0,
        "b": 1,
        "c": 2,
        "d": 3,
        "e": 4,
        "f": 5,
        "g": 6,
        "h": 7
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
        self.whiteArmy = createArmy(.white)
        self.blackArmy = createArmy(.black)
        updateBoard()
    }

    /// Move chess piece on the board function.
    ///
    /// - Parameter playerInput: The prompted command to move a chess piece.
    public mutating func getCommandInfo(_ input: String, _ state: Turn) {
        let start = input.startIndex
        let firstBreak = input.index(start, offsetBy: 3)
        let secondBreak = input.index(start, offsetBy: 5)
        let source = String(input[input.index(after: start)..<firstBreak])
        let destination = String(input[secondBreak...])

        // Info
        let tag = String(input[start])
        let sourceCoord = convertAlphabetToCoordinates(source)
        let destCoord = convertAlphabetToCoordinates(destination)
        switch state {
            case .whiteTurn:
                var newWhiteArmy: [ChessPiece] = []
                for piece in whiteArmy {
                    if piece.tag == tag && piece.currentPosition == sourceCoord {
                        var newPiece = piece
                        newPiece.currentPosition = destCoord
                        newWhiteArmy.append(newPiece)
                    } else {
                        newWhiteArmy.append(piece)
                    }
                }
                whiteArmy = newWhiteArmy
            case .blackTurn:
                var newBlackArmy: [ChessPiece] = []
                for piece in blackArmy {
                    if piece.tag == tag && piece.currentPosition == sourceCoord {
                        var newPiece = piece
                        newPiece.currentPosition = destCoord
                        newBlackArmy.append(newPiece)
                    }
                    else {
                        newBlackArmy.append(piece)
                    }
                }
                blackArmy = newBlackArmy
        }
        updateBoard()
    }

    private mutating func updateBoard() {
        for i in 0..<board.count {
            for j in 0..<board.count {
                self.board[i][j] = "_"
            }
        }
        for piece in whiteArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
        }
        for piece in blackArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
        }
    }

    private func convertAlphabetToCoordinates(_ inputPosition: String) -> Position {
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

}

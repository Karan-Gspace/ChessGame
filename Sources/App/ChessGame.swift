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
    public var checkMate: Bool = false

    /// Definition of a check.
    public var check: Bool = false

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

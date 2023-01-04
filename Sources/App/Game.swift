/// The chess board is responsible for keeping track of pieces left standing and
/// pieces removed off the board.
///
/// Chess is a game played for thousands of years on an 8x8 grid board. Pieces
/// move throughout the board by two oponents, black and white. The GameBoard
/// contains a board matrix for monitoring the active pieces on the chess board.
/// The GameBoard also contains pieces in the graveyard for inactive pieces.
public struct Game {

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

    /// Creates a new Game.
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
        /// Create white army
        let whiteArmy = createArmy(.white)
        /// Create black army
        let blackArmy = createArmy(.black)
        /// Insert armies onto the board.
        insertArmiesOntoBoard(whiteArmy, blackArmy)
    }

    private func createArmy(_ colour: PlayerColour) -> [ChessPiece] {
        var blackArmy: [ChessPiece] = []
        let king = ChessPiece.createKing(colour: colour)
        let queen = ChessPiece.createQueen(colour: colour)
        let bishops = ChessPiece.createBishops(colour: colour)
        let knights = ChessPiece.createKnights(colour: colour)
        let rooks = ChessPiece.createRooks(colour: colour)
        let pawns = ChessPiece.createPawns(colour: colour)
        blackArmy.append(king)
        blackArmy.append(queen)
        blackArmy.append(contentsOf: bishops)
        blackArmy.append(contentsOf: knights)
        blackArmy.append(contentsOf: rooks)
        blackArmy.append(contentsOf: pawns)
        return blackArmy
    }

    private mutating func insertArmiesOntoBoard(
        _ whiteArmy: [ChessPiece],
        _ blackArmy: [ChessPiece]
        ) {
        // Insert White army onto board
        for piece in whiteArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
        }
        // Insert White army onto board
        for piece in blackArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
        }
    }

}

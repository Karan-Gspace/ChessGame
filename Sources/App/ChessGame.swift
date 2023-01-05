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
    private var graveyard: [ChessPieceProtocol] = []

    /// Definition of white army active pieces.
    private var whiteArmy: [ChessPieceProtocol] = []

    /// Definition of black army active pieces.
    private var blackArmy: [ChessPieceProtocol] = []

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
            var newWhiteArmy: [ChessPieceProtocol] = []
            for piece in whiteArmy {
                if piece.tag == tag && piece.currentPosition == sourceCoord && piece.validMoves.contains(destCoord) {
                    var newPiece = piece
                    newPiece.currentPosition = destCoord
                    newWhiteArmy.append(newPiece)
                } else {
                    newWhiteArmy.append(piece)
                }
            }
            whiteArmy = newWhiteArmy
        case .blackTurn:
            var newBlackArmy: [ChessPieceProtocol] = []
            for piece in blackArmy {
                if piece.tag == tag && piece.currentPosition == sourceCoord && piece.validMoves.contains(destCoord) {
                    var newPiece = piece
                    newPiece.currentPosition = destCoord
                    newBlackArmy.append(newPiece)
                } else {
                    newBlackArmy.append(piece)
                }
            }
            blackArmy = newBlackArmy
        }
        updateBoard()
    }

    /// Function which updates the state of the board.
    private mutating func updateBoard() {
        for i in 0..<board.count {
            for j in 0..<board.count {
                self.board[i][j] = "_"
            }
        }
        for var piece in whiteArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
            piece.validMoves = getValidMoves(piece)
        }
        for var piece in blackArmy {
            self.board[piece.currentPosition.x][piece.currentPosition.y] = piece.tag
            piece.validMoves = getValidMoves(piece)
        }
    }

    /// Abstract this switch statement function through Polymorphism via structs
    /// and protocol conformance.
    private func getValidMoves(_ piece: ChessPieceProtocol) -> [Position] {
        var validMoves: [Position] = []
        switch piece.name {
        case .king:
            validMoves.append(
                contentsOf: [
                    Position(piece.currentPosition.x + 1, piece.currentPosition.y + 1),
                    Position(piece.currentPosition.x - 1, piece.currentPosition.y - 1),
                    Position(piece.currentPosition.x + 1, piece.currentPosition.y - 1),
                    Position(piece.currentPosition.x - 1, piece.currentPosition.y + 1)
                ]
            )
        case .queen:
        for i in piece.currentPosition.x..<board.count + 1 {
            validMoves.append(Position(i + 1, piece.currentPosition.y + i + 1))
            validMoves.append(Position(i - 1, piece.currentPosition.y - i - 1))
            validMoves.append(Position(piece.currentPosition.x + i + 1, i + 1))
            validMoves.append(Position(piece.currentPosition.x - i - 1, i - 1))
        }
        for i in piece.currentPosition.x..<board.count + 1 {
            validMoves.append(Position(i + 1, piece.currentPosition.y))
            validMoves.append(Position(i - 1, piece.currentPosition.y))
            validMoves.append(Position(piece.currentPosition.x, i + 1))
            validMoves.append(Position(piece.currentPosition.x, i - 1))
        }
        case .bishop:
        for i in piece.currentPosition.x..<board.count + 1 {
            validMoves.append(Position(i + 1, piece.currentPosition.y + i + 1))
            validMoves.append(Position(i - 1, piece.currentPosition.y - i - 1))
            validMoves.append(Position(piece.currentPosition.x + i + 1, i + 1))
            validMoves.append(Position(piece.currentPosition.x - i - 1, i - 1))
        }
        case .knight:
        validMoves.append(
            contentsOf: [
                Position(piece.currentPosition.x + 2, piece.currentPosition.y - 1),
                Position(piece.currentPosition.x + 2, piece.currentPosition.y + 1),
                Position(piece.currentPosition.x - 2, piece.currentPosition.y - 1),
                Position(piece.currentPosition.x - 2, piece.currentPosition.y + 1),
                Position(piece.currentPosition.x + 1, piece.currentPosition.y - 2),
                Position(piece.currentPosition.x + 1, piece.currentPosition.y + 2),
                Position(piece.currentPosition.x - 1, piece.currentPosition.y + 2),
                Position(piece.currentPosition.x - 1, piece.currentPosition.y - 2)
            ]
        )
        case .rook:
        for i in piece.currentPosition.x..<board.count + 1 {
            validMoves.append(Position(i + 1, piece.currentPosition.y))
            validMoves.append(Position(i - 1, piece.currentPosition.y))
            validMoves.append(Position(piece.currentPosition.x, i + 1))
            validMoves.append(Position(piece.currentPosition.x, i - 1))
        }
        case .pawn:
        validMoves.append(
            contentsOf: [
                Position(piece.currentPosition.x + 1, piece.currentPosition.y)
            ]
        )
        }
        return validMoves
    }

    private func convertAlphabetToCoordinates(_ inputPosition: String) -> Position {
        let xCoord = alphabetToNum[String(inputPosition[inputPosition.startIndex])]
        let yCoord = Int(String(inputPosition[inputPosition.index(after: inputPosition.startIndex)]))
        return Position(xCoord!, yCoord!)
    }

    private func createArmy(_ colour: PlayerColour) -> [ChessPieceProtocol] {
        var army: [ChessPieceProtocol] = []
        let king = ChessGame.createKing(colour: colour)
        let queen = ChessGame.createQueen(colour: colour)
        let bishops = ChessGame.createBishops(colour: colour)
        let knights = ChessGame.createKnights(colour: colour)
        let rooks = ChessGame.createRooks(colour: colour)
        let pawns = ChessGame.createPawns(colour: colour)
        army.append(king)
        army.append(queen)
        army.append(contentsOf: bishops)
        army.append(contentsOf: knights)
        army.append(contentsOf: rooks)
        army.append(contentsOf: pawns)
        return army
    }

    /// Function which creates a King Chess piece and where it should be on the
    /// board.
    ///
    /// - Parameter colour: The colour of which the king piece belongs to.
    /// - Returns: The King chess piece.
    private static func createKing(
        colour: PlayerColour
    ) -> ChessPieceProtocol {
        var startingPosition = Position(0, 0)
        if colour == PlayerColour.black {
            startingPosition = Position(0, 4)
        }
        if colour == PlayerColour.white {
            startingPosition = Position(7, 4)
        }
        return King(colour: colour, currentPosition: startingPosition)
    }

    /// Function which creates a Queen Chess piece and where it should be on the
    /// board.
    ///
    /// - Parameter colour: The colour of which the queen piece belongs to.
    /// - Returns: The Queen chess piece.
    private static func createQueen(
        colour: PlayerColour
    ) -> ChessPieceProtocol {
        var startingPosition = Position(0, 0)
        if colour == PlayerColour.black {
            startingPosition = Position(0, 3)
        }
        if colour == PlayerColour.white {
            startingPosition = Position(7, 3)
        }
        return Queen(colour: colour, currentPosition: startingPosition)
    }

    /// Function which creates the two bishop Chess pieces and where it should
    /// be on the board.
    ///
    /// - Parameter colour: The colour of which the bishop pieces belongs to.
    /// - Returns: An array of the two Bishops.
    private static func createBishops(
        colour: PlayerColour
    ) -> [ChessPieceProtocol] {
        var leftStartingPosition = Position(0, 0)
        var rightStartingPosition = Position(0, 0)
        if colour == PlayerColour.black {
            leftStartingPosition = Position(0, 2)
            rightStartingPosition = Position(0, 5)
        }
        if colour == PlayerColour.white {
            leftStartingPosition = Position(7, 2)
            rightStartingPosition = Position(7, 5)
        }
        return [
            Bishop(colour: colour, currentPosition: leftStartingPosition),
            Bishop(colour: colour, currentPosition: rightStartingPosition)
        ]
    }

    /// Function which creates the two knight Chess pieces and where it should
    /// be on the board.
    ///
    /// - Parameter colour: The colour of which the knight pieces belongs to.
    /// - Returns: An array of the two Knights.
    private static func createKnights(
        colour: PlayerColour
    ) -> [ChessPieceProtocol] {
        var leftStartingPosition = Position(0, 0)
        var leftValidMoves: [Position] = []
        var rightStartingPosition = Position(0, 0)
        var rightValidMoves: [Position] = []
        if colour == PlayerColour.black {
            leftStartingPosition = Position(0, 1)
            leftValidMoves.append(Position(2, 0))
            leftValidMoves.append(Position(2, 2))
            rightStartingPosition = Position(0, 6)
            rightValidMoves.append(Position(2, 5))
            rightValidMoves.append(Position(2, 7))

        }
        if colour == PlayerColour.white {
            leftStartingPosition = Position(7, 1)
            leftValidMoves.append(Position(5, 2))
            leftValidMoves.append(Position(5, 0))
            rightStartingPosition = Position(7, 6)
            rightValidMoves.append(Position(5, 5))
            rightValidMoves.append(Position(5, 7))
        }
        return [
            Knight(colour: colour, currentPosition: leftStartingPosition, validMoves: leftValidMoves),
            Knight(colour: colour, currentPosition: rightStartingPosition, validMoves: rightValidMoves)
        ]
    }

    /// Function which creates the two knight Chess pieces and where it should
    /// be on the board.
    ///
    /// - Parameter colour: The colour of which the knight pieces belongs to.
    /// - Returns: An array of the two Knights.
    private static func createRooks(
        colour: PlayerColour
    ) -> [ChessPieceProtocol] {
        var leftStartingPosition = Position(0, 0)
        var rightStartingPosition = Position(0, 0)
        if colour == PlayerColour.black {
            leftStartingPosition = Position(0, 0)
            rightStartingPosition = Position(0, 7)

        }
        if colour == PlayerColour.white {
            leftStartingPosition = Position(7, 0)
            rightStartingPosition = Position(7, 7)
        }
        return [
            Rook(colour: colour, currentPosition: leftStartingPosition),
            Rook(colour: colour, currentPosition: rightStartingPosition)
        ]
    }

    /// Function which creates the eight pawns Chess pieces and where it should
    /// be on the board.
    ///
    /// - Parameter colour: The colour of which the pawns pieces belongs to.
    /// - Returns: An array of the eight pawns Knights.
    private static func createPawns(
        colour: PlayerColour
    ) -> [ChessPieceProtocol] {
        var pawns: [ChessPieceProtocol] = []
        var position = Position(0, 0)
        var validMoves: [Position] = []
        if colour == PlayerColour.white {
            for i in 0..<8 {
                position = Position(6, i)
                validMoves.append(contentsOf: [Position(5, i), Position(4, i)])
                pawns.append(Pawn(colour: colour, currentPosition: position, validMoves: validMoves))
            }
        }
        if colour == PlayerColour.black {
            for i in 0..<8 {
                validMoves = []
                position = Position(1, i)
                validMoves.append(contentsOf: [Position(2, i), Position(3, i)])
                pawns.append(Pawn(colour: colour, currentPosition: position, validMoves: validMoves))
            }
        }
        return pawns
    }

}

/// Chess pieces are responsible for providing functionality of each chess piece
/// on the chess board for the user.
///
/// In the game of chess, pieces are distinct an based on those distinctions can
/// can have specific characteristics and functionality. For example, pawns move
/// forward on the board by 1 square per turn, their bonus functionality is being
/// promoted to a piece of greater value such as a knight, rook, queen or bishop.
/// The ChessPieces struct sets up the distinctions and functionalities per piece.
struct ChessPiece: PiecesProtocol {

    /// Types of pieces that exist in chess.
    enum ChessPieceType: String {
        /// King piece
        case king = "K"
        /// Queen piece
        case queen = "Q"
        /// Bishop piece
        case bishop = "B"
        /// Knight piece
        case knight = "k"
        /// Rook piece
        case rook = "r"
        /// Pawn piece
        case pawn = "p"
    }

    /// Name of the chess piece.
    let name: ChessPieceType

    /// The colour of the chess piece.
    let colour: PlayerColour

    /// Tag of the chess piece to be displayed on the board.
    let tag: String

    /// The available positions where the Chess piece can move on the board.
    var validMoves: [Position]

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Creates a new chess piece. (designated initializer)
    ///
    /// - Parameter name: The name of the chess piece.
    /// - Paremeter colour: The player which this chess piece belongs to.
    private init(
        name: ChessPieceType,
        colour: PlayerColour,
        tag: String = "",
        validMoves: [Position] = [],
        currentPosition: Position = Position(0, 0)
    ) {
        self.name = name
        self.colour = colour
        self.tag = tag
        self.validMoves = validMoves
        self.currentPosition = currentPosition
    }

    /// Function which creates a King Chess piece and where it should be on the
    /// board.
    /// - Parameter colour: The colour of which the king piece belongs to.
    /// - Returns: The King chess piece.
    public func createKing(
        colour: PlayerColour
    ) -> ChessPiece {
        var startingPosition: Position = Position(0, 0)
        if colour == PlayerColour.black {
            startingPosition = Position(0, 4)

        } else if colour == PlayerColour.white {
            startingPosition = Position(7, 4)
        }
        return ChessPiece(
            name: .king,
            colour: colour,
            tag: ChessPieceType.king.rawValue,
            currentPosition: startingPosition
        )

    }

}

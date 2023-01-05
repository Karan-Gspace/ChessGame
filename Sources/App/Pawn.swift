/// The Pawn piece.
struct Pawn: ChessPieceProtocol {

    /// Name of the Pawn piece.
    var name: ChessPieceType = .pawn

    /// The colour of the Pawn piece.
    var colour: PlayerColour

    /// Tag of the Pawn piece to be displayed on the board.
    var tag: String = ChessPieceType.pawn.rawValue

    /// The available positions where the Pawn piece can move on the board.
    var validMoves: [Position]

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Create Pawn Chess Piece.
    ///
    /// - Parameter colour: The colour of the Pawn piece
    /// - Parameter currentPosition: The starting position of the Pawn piece.
    init(colour: PlayerColour, currentPosition: Position, validMoves: [Position] = []) {
        self.colour = colour
        self.currentPosition = currentPosition
        self.validMoves = validMoves
    }

}

/// The Bishop piece.
struct Bishop: ChessPieceProtocol {

    /// Name of the Bishop piece.
    var name: ChessPieceType = .bishop

    /// The colour of the Bishop piece.
    var colour: PlayerColour

    /// Tag of the Bishop piece to be displayed on the board.
    var tag: String = ChessPieceType.bishop.rawValue

    /// The available positions where the Bishop piece can move on the board.
    var validMoves: [Position] = []

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Create Bishop Chess Piece.
    ///
    /// - Parameter colour: The colour of the Bishop piece
    /// - Parameter currentPosition: The starting position of the Bishop piece.
    init(colour: PlayerColour, currentPosition: Position) {
        self.colour = colour
        self.currentPosition = currentPosition
    }

}

/// The King piece.
struct King: ChessPieceProtocol {

    /// Name of the king piece.
    var name: ChessPieceType = .king

    /// The colour of the king piece.
    var colour: PlayerColour

    /// Tag of the king piece to be displayed on the board.
    var tag: String = ChessPieceType.king.rawValue

    /// The available positions where the king piece can move on the board.
    var validMoves: [Position] = []

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Create King CHess Piece.
    ///
    /// - Parameter colour: The colour of the king piece
    /// - Parameter currentPosition: The starting position of the king piece.
    init(colour: PlayerColour, currentPosition: Position) {
        self.colour = colour
        self.currentPosition = currentPosition
    }

}

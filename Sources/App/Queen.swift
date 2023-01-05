/// The Queen piece.
struct Queen: ChessPieceProtocol {

    /// Name of the Queen piece.
    var name: ChessPieceType = .queen

    /// The colour of the queen piece.
    var colour: PlayerColour

    /// Tag of the queen piece to be displayed on the board.
    var tag: String = ChessPieceType.queen.rawValue

    /// The available positions where the queen piece can move on the board.
    var validMoves: [Position] = []

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Create queen Chess Piece.
    ///
    /// - Parameter colour: The colour of the queen piece
    /// - Parameter currentPosition: The starting position of the queen piece.
    init(colour: PlayerColour, currentPosition: Position) {
        self.colour = colour
        self.currentPosition = currentPosition
    }

}

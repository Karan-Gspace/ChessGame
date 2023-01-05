/// The Rook piece.
struct Rook: ChessPieceProtocol {

    /// Name of the Rook piece.
    var name: ChessPieceType = .rook

    /// The colour of the Rook piece.
    var colour: PlayerColour

    /// Tag of the Rook piece to be displayed on the board.
    var tag: String = ChessPieceType.rook.rawValue

    /// The available positions where the Rook piece can move on the board.
    var validMoves: [Position] = []

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Create Rook Chess Piece.
    ///
    /// - Parameter colour: The colour of the Rook piece
    /// - Parameter currentPosition: The starting position of the Rook piece.
    init(colour: PlayerColour, currentPosition: Position) {
        self.colour = colour
        self.currentPosition = currentPosition
    }

}

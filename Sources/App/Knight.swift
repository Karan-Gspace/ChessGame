/// The Knight piece.
struct Knight: ChessPieceProtocol {

    /// Name of the Knight piece.
    var name: ChessPieceType = .knight

    /// The colour of the Knight piece.
    var colour: PlayerColour

    /// Tag of the Knight piece to be displayed on the board.
    var tag: String = ChessPieceType.knight.rawValue

    /// The available positions where the Knight piece can move on the board.
    var validMoves: [Position]

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Create Knight Chess Piece.
    ///
    /// - Parameter colour: The colour of the Knight piece
    /// - Parameter currentPosition: The starting position of the Knight piece.
    init(colour: PlayerColour, currentPosition: Position, validMoves: [Position] = []) {
        self.colour = colour
        self.currentPosition = currentPosition
        self.validMoves = validMoves
    }

}

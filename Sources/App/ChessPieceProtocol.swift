/// Chess pieces are responsible for defining functionality of each chess piece
/// on the chess board for the user.
///
/// In the game of chess, pieces are distinct an based on those distinctions can
/// can have specific characteristics and functionality. For example, pawns move
/// forward on the board by 1 square per turn, their bonus functionality is being
/// promoted to a piece of greater value such as a knight, rook, queen or bishop.
/// The ChessPieces struct sets up the distinctions and functionalities per piece.
protocol ChessPieceProtocol {

    /// Name of the chess piece.
    var name: ChessPieceType { get }

    /// The colour of the chess piece.
    var colour: PlayerColour { get }

    /// Tag of the chess piece to be displayed on the board.
    var tag: String { get }

    /// The available positions where the Chess piece can move on the board.
    var validMoves: [Position] { get set }

    /// The current position of the Chess piece on the board.
    var currentPosition: Position { get set }

}

/// The pieces type defines all the pieces to be used on a gameboard board.
///
/// The pieces are an essential part to the game of chess. Their positions on the
/// board and coordination dictate the behaviour of the game. The Pieces type
/// stores the rules for each of the pieces and the valid moves of those pieces.
protocol PiecesProtocol {

    /// The available positions where the piece can move on the board.
    var validMoves: [Position] { get }

    /// The current position of the piece on the board.
    var currentPosition: Position { get }

}

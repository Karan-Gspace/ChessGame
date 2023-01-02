/// The chess board is responsible for keeping track of pieces left standing and
/// pieces removed off the board.
///
/// Chess is a game played for thousands of years on an 8x8 grid board. Pieces
/// move throughout the board by two oponents, black and white. The GameBoard
/// contains a board matrix for monitoring the active pieces on the chess board.
/// The GameBoard also contains pieces in the graveyard for inactive pieces.
struct GameBoard {

    /// Definition of the 8 x 8 chess board containing active pieces.
    var board[[String]] = [
        ["_", "_", "_", "_", "_", "_", "_", "_"],
        ["_", "_", "_", "_", "_", "_", "_", "_"],
        ["_", "_", "_", "_", "_", "_", "_", "_"],
        ["_", "_", "_", "_", "_", "_", "_", "_"],
        ["_", "_", "_", "_", "_", "_", "_", "_"],
        ["_", "_", "_", "_", "_", "_", "_", "_"],
        ["_", "_", "_", "_", "_", "_", "_", "_"],
        ["_", "_", "_", "_", "_", "_", "_", "_"]
    ]

    /// Definition of the array containing inactive pieces.
    var graveyard: [Pieces] = []

}

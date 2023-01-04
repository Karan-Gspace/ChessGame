/// Position type to store the x and y position of the chess piece on the
/// chess board.
struct Position {
    /// The x position on the chess board.
    var x: Int
    /// The y position on the chess board.
    var y: Int

    /// Create a position data type.
    ///
    /// - Parameter x: The x coordinate.
    /// - Parameter y: The y coordinate.
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

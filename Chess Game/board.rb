require_relative "piece"

class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) {Array.new(8){NullPiece.new}}
    @board[0] = Array.new(8){Piece.new}
    @board[1] = Array.new(8){Piece.new}
    @board[6] = Array.new(8){Piece.new}
    @board[7] = Array.new(8){Piece.new}
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @board[x][y] = piece
  end

  def move_piece(start_pos, end_pos)
    if start_pos.all?{|el| el.between?(0, 7)} || end_pos.all?{|el| el.between?(0,7)}
      raise "That is not a position on the board!"
    elsif self[end_pos].class == Piece
      raise "Uhhhh... there's a piece there already..."
    elsif self[start_pos].class == NullPiece
      raise "There is no piece there, you fool!"
      # if the piece at the end position is the same color as your piece,
      # this is not a valid move :(
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.new
    end
  end

  def valid_pos?(pos)
  end
end

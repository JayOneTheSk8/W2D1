require_relative "piece"

class Board

  def initialize
    @board = Array.new(8) {Array.new(8){NullPiece.new}}

  end

  def move_piece(color, start_pos, end_pos)
    if @board[start_pos].class == NullPiece
      raise "There is no piece there, you fool!"
    elsif Piece.color
      # if the piece at the end position is the same color as your piece, this is not a valid move :(

    end

    if valid_pos?(end_pos)
      @board[start_pos] = NullPiece.new
      @board[end_pos] = nil #piece in question
      #execute the rest
    end
  end

  def valid_pos?(pos)
  end
end

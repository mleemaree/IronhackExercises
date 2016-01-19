require 'pry'
require 'colorize'

class ChessBoard
	def initialize
		@board = Array.new(7){Array.new(7){"--"}}
		color
	end

	def color
		ner= @board[0][0].colorize(:red)
		puts ner
	end
end

ChessBoard.new
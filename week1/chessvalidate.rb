require 'pry'

class Chess_Piece
	def initialize
		#Can only move around on Board
	end
end

class Pawn < Chess_Piece
	def initialize(init_posi = [0,0])
		@init_posi = init_posi
		move
	end

	def move
	end

end


class Rook < Chess_Piece
	def initialize(init_posi = [0,0])
		@init_posi = init_posi
		move
	end

	def move
		puts "Input next move."
		new_move=gets.chomp.split(',')

		if new_move[0].to_i == @init_posi[0]
			@init_posi[1] = new_move[1].to_i
		elsif new_move[1].to_i==@init_posi[1]
			@init_posi[0] = new_move[0].to_i
		else
			puts "Illegal Move. Input next move."
		end
		puts "Your rook is now at: #{@init_posi}"
	end
end

class Bishop < Chess_Piece
	def initialize(init_posi = [0,2])
		@init_posi = init_posi
		move
	end
	def move
		puts "Input next move."
		new_move=gets.chomp.split(',')
		zero_move = (new_move[0].to_i - @init_posi[0]).abs
		one_move = (new_move[1].to_i - @init_posi[1]).abs


		if zero_move == one_move 
			@init_posi[0] = new_move[0].to_i
			@init_posi[1] = new_move[1].to_i
		else
			puts "Illegal Move. Input next move."
		end
		puts "Your bishop is now at: #{@init_posi}"
	end
end

class Knight < Chess_Piece
	def initialize(init_posi = [0,0])
		@init_posi = init_posi
		move
	end

	def move
	end
	
end

class Queen < Chess_Piece
	def initialize(init_posi = [0,0])
		@init_posi = init_posi
		move
	end

	def move
		puts "Input next move."
		new_move=gets.chomp.split(',')
		zero_move = (new_move[0].to_i - @init_posi[0]).abs
		one_move = (new_move[1].to_i - @init_posi[1]).abs
		# if zero_move == one_move
		# 	@init_posi[0] = new_move[0].to_i
		# 	@init_posi[1] = new_move[1].to_i
		# elsif new_move[0].to_i == @init_posi[0]
		# 	@init_posi[1] = new_move[1].to_i
		# elsif new_move[1].to_i==@init_posi[1]
		# 	@init_posi[0] = new_move[0].to_i
		# else
		# 	puts "Illegal Move. Input next move."
		# end
	end
	
end

class King < Chess_Piece
	def initialize(init_posi = [0,0])
		@init_posi = init_posi
	end

	def move
	end
	
end


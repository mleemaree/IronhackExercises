require 'pry'

class Chess_Piece
	def initialize(piece)
		#Can only move around on Board
		@piece = piece
		@piece.new
	end
end


class Pawn < Chess_Piece
	def initialize(init_posi = [1,1])
		@init_posi = init_posi
		@new_posi = @new_posi
		move
	end

	def move
		puts "Input next move."
		@new_posi=gets.chomp.split(',')
		@init_posi[1] = @new_posi[1].to_i
		@init_posi[0] = @new_posi[0].to_i
		puts "Your pawn is now at: #{@init_posi}"
	end
end


class Rook < Chess_Piece
	def initialize(init_posi = [0,0])
		@init_posi = init_posi
		@new_posi = @new_posi
		move
	end

	def move
		puts "Input next move."
		new_posi=gets.chomp.split(',')

		if new_posi[0].to_i == @init_posi[0]
			@init_posi[1] = new_posi[1].to_i
			puts "Your Rook is now at: #{@init_posi}"
		elsif new_posi[1].to_i==@init_posi[1]
			@init_posi[0] = new_posi[0].to_i
			puts "Your Rook is now at: #{@init_posi}"
		else
			puts "Illegal Move. Input next move."
		end
	end
end


class Bishop < Chess_Piece
	def initialize(init_posi = [0,2])
		@init_posi = init_posi
		@new_posi = @new_posi
		move
	end
	def move
		puts "Input next move."
		new_posi=gets.chomp.split(',')
		zero_move = (new_posi[0].to_i - @init_posi[0]).abs
		one_move = (new_posi[1].to_i - @init_posi[1]).abs


		if zero_move == one_move 
			@init_posi[0] = new_posi[0].to_i
			@init_posi[1] = new_posi[1].to_i
			puts "Your Bishop is now at: #{@init_posi}"
		else
			puts "Illegal Move. Input next move."
		end
	end
end


class Knight < Chess_Piece
	def initialize(init_posi = [0,1])
		@init_posi = init_posi
		@new_posi = @new_posi
		move
	end

	def move
		puts "Input next move."
		new_posi=gets.chomp.split(',')
		@new_posi_x = new_posi[0].to_i
		@new_posi_y = new_posi[1].to_i
		if (@init_posi[0] - @new_posi_x).abs == 2 || (@init_posi[1] - @new_posi_y).abs == 2 && (@init_posi[0] - @new_posi_x).abs ==1 || (@init_posi[1] - @new_posi_y).abs == 1
			@init_posi[0] = @new_posi_x
			@init_posi[1] = @new_posi_y
			puts "Your Knight is now at: #{@init_posi}"
		else
			puts "Illegal Move. Input next move."
			move
		end
	end
	
end


class Queen < Chess_Piece
	def initialize(init_posi = [0,5])
		@init_posi = init_posi
		@new_posi = @new_posi
		move
	end

	def move
		puts "Input next move."
		new_posi=gets.chomp.split(',')
		zero_move = (new_posi[0].to_i - @init_posi[0]).abs
		one_move = (new_posi[1].to_i - @init_posi[1]).abs
		if zero_move == one_move
			@init_posi[0] = new_posi[0].to_i
			@init_posi[1] = new_posi[1].to_i
			puts "Your Queen is now at: #{@init_posi}"
		elsif new_posi[0].to_i == @init_posi[0]
			@init_posi[1] = new_posi[1].to_i
			puts "Your Queen is now at: #{@init_posi}"
		elsif new_posi[1].to_i==@init_posi[1]
			@init_posi[0] = new_posi[0].to_i
			puts "Your Queen is now at: #{@init_posi}"
		else
			puts "Illegal Move. Input next move."
		end
	end
end


class King < Chess_Piece
	def initialize(init_posi = [0,4])
		@init_posi = init_posi
		@new_posi = @new_posi
		move
	end

	def move
		puts "Input next move."
		new_posi=gets.chomp.split(',')

		if (@init_posi[0] - new_posi[0].to_i).abs <= 1 || (@init_posi[0] - new_posi[0].to_i).abs <= 1 
			zero_move = (new_posi[0].to_i - @init_posi[0]).abs
			one_move = (new_posi[1].to_i - @init_posi[1]).abs
			if zero_move == one_move
				@init_posi[0] = new_posi[0].to_i
				@init_posi[1] = new_posi[1].to_i
				puts "Your King is now at: #{@init_posi}"
			elsif new_posi[0].to_i == @init_posi[0]
				@init_posi[1] = new_posi[1].to_i
				puts "Your King is now at: #{@init_posi}"
			elsif new_posi[1].to_i==@init_posi[1]
				@init_posi[0] = new_posi[0].to_i
				puts "Your King is now at: #{@init_posi}"
			else
				puts "Illegal Move. Input next move."
			end
		else
			puts "Illegal Move. Input next move."
		end
	end
end


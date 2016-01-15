require "pry"

class Univers
	def initialize(planets_array)
		@planets_array= planets_array
	end
	def planets_positions
		@planets_array.each { |p|
		planet_name = puts [p.planet_name,p.planet_position]
		planet_position = puts p.planet_position
	}
	end
end

class Planet
	attr_reader :planet_position, :planet_name, :gemm
	def initialize(planet_name, gemm, planet_position)
		@planet_name =planet_name
		@gemm = gemm
		@planet_position=planet_position
	end
	# def locate_planet(coordinates)
	# 	@planet_position=coordinates
	# end
	# def welcome()
	# 	if user_position == @planet_position
	# 		print "#{@planet_name} +#{@planet_position} \n"
	# 	end
	# end
end

class User
	attr_accessor :name, :user_position
	planet_position = @planet_position

	def initialize (user_name, user_position=[0,0], sac=[])
		@user_name=user_name
		@user_position=user_position
		@sac=[]
	end

	def move
		puts	"Please type N, S, E, W"
		direction=gets.chomp.upcase	
		@user_position = self.user_position
		case direction
		when "N"
			user_position[1]+=1
		when "S"
			user_position[1]-=1
		when "E"
			user_position[0]+=1
		when "W"
			user_position[0]-=1
		else
			"Please type N, S, E, W"
		end

	end

	def position
		print @user_position
		#if @user_position == planet_position
	end	
end



planet1=Planet.new("TARGYTE","saphires",[0,-1])
planet2=Planet.new("PAN","diamonds",[1,0])
planet3=Planet.new("KARI","emeralds",[0,0])
planet4=Planet.new("TARVOS","rubies",[0,1])
planet5=Planet.new("EARTH","gold",[-1,0])

planets_array=[planet1,planet2,planet3,planet4,planet5]

universe=Univers.new(planets_array)

universe.planets_positions


user1= User.new("mario")
user1.move
user1.position







# user1.move

# puts user1.position
# print "Your current position is #{user1.position}"
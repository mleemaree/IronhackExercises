require 'pry'



apples = {:item => "apples", :price => 10}    
oranges = {:item => "oranges", :price => 5}  
grapes = {:item => "grapes", :price => 15}     
banana = {:item => "banana", :price => 20}     
watermelon = {:item => "watermelon", :price => 50} 



# class Welcome
# 	attr_reader :fruits
# 	def initialize
# 		@fruits = fruits
# 	end
# 	puts "\nWelcome to our store! Here you can buy:\n
# 	apples     10$
# 	oranges     5$
# 	grapes     15$
# 	bananas    20$
# 	watermelon 50$
# 	\nWhat would you like?"
# 	@fruits = gets.chomp
# end

# cart = {
# 	banana = {:price => 20, :quantity => 2}
# 	apples = {:price => 10, :quantity => 3}
# }

class ShoppingCart
	def initialize(items, quantity)
		@items = items
		@quantity = quantity
		@cart = {}
		add_item_to_cart
	end
	def add_item_to_cart
		# @items.each do |item|
		# 	@cart << {item[:item], item[:price]
		# end
		# counter = @cart.each_with_object(Hash.new(0)) { |item,counts| counts[item] += 1 }
		# binding.pry
		# puts counter[]

		@items.each do |key, value|
			print key
			print value
		end


	end

	def show_cart

	end
end






my_cart = ShoppingCart.new(apples, 2)
binding.pry
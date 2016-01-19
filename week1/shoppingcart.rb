require 'pry'



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


# Items = [
# 	{:item => banana, :price => 20}
# ]

# class Item
# 	def initialize(item)
# 		@item = item
# 		@name = item[:item]
# 		@price = item[:price]
# 	end
# end

# class Fruit < Item
# 	def initialize(name)
# 		@name = item[:item]
# 		@price = item[:price]
# 	end

# 	def 
		
# 	end
# end

	# banana = {:name => "banana", :price => 20, :quantity =>0}
	# apple = {:name => "apple", :price => 10, :quantity =>0}

# class Item
# 	def initialize (item, price)
# 		@item = item
# 		@price = price
# 	end

# 	def add_price

# 	end
# end


class ShoppingCart
	attr_accessor :cart
	def initialize
		@cart = []
		@result = []
		# add_item_to_cart
	end
	def add_item_to_cart(item)
			if @cart.include?(item)
				item.quantity += 1
			else
				@cart << item
			end
	end
end

class Checkout
	def initialize(cart)
		@cart = cart
		show
	end

	def show
		binding.pry
	end
end

class Item
	attr_accessor :quantity
	attr_reader :name, :price
	def initialize(name,price)
		@name = name
		@price = price
		@quantity = 1
	end
end

apple = Item.new("apple", 5)
banana = Item.new("banana", 20)

my_cart = ShoppingCart.new

my_cart.add_item_to_cart(apple)
my_cart.add_item_to_cart(banana)
my_cart.add_item_to_cart(banana)

Checkout.new(my_cart)



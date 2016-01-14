class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Pablos's place", "Ibiza", 2, 22),
  Home.new("Lily's place", "Andorra", 4, 37),
  Home.new("Cameron's place", "Denver", 5, 42),
  Home.new("Mary's place", "Santa Cruz", 2, 55),
  Home.new("Manny's place", "Seattle", 3, 48)
]

def array_printer(array)
  array.each do | hm |
    puts "#{hm.name}'s place in #{hm.city}"
	puts "Price: $#{hm.price} a night"
  end
end
# sorted home names

def sorter_n(array)
	sorted = array.sort_by{|i| i.price}
	array_printer(sorted)

	#highest to lowest
	puts "Would you like to search Highest to Lowest price?"
	h_l = gets.chomp
	if h_l == "yes"
		sorted = array.sort_by{|i| i.price}.reverse
		array_printer(sorted)
	else
		array_printer(sorted)
	end

	#capacity
	puts "Would you like to search by capacity?"
	cap = gets.chomp
	if cap == "yes"
		sorted = array.sort_by{|i| i.capacity}
		array_printer(sorted)
	else
		array_printer(sorted)
	end
end

sorter_n(homes)

# search city

def chooser(array)
	puts "Where would you like to go?"
	s_city = gets.chomp
	selected = array.select{|hm| hm.city == s_city}
	array_printer(selected)
end

chooser(homes)

#average price

def average(array)
	prices = array.map { |hm| hm.price}
	average = prices.reduce(0){|sum, hm| sum + hm} / prices.size
	puts "Average: $#{average}"
end

average(homes)

# Name own price

def pricer(array)
	puts "How much would you like to spend?"
	s_price = gets.chomp.to_i
	select_p = array.find do |hm|
		 hm.price == s_price
	end
	puts select_p.name
end

pricer(homes)
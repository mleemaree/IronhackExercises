require 'pry'
class Post
	attr_reader(:title, :date, :text, :sponsored)
	def initialize(title, date, text, sponsored = false)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end

class Blog
	def initialize()
		@container = []
		@index = 0
	end

	def add_post(post)
		@container << post
	end

	def publish_front_page
		sorted_posts = @container.sort{|a,b| a.date <=> b.date}
		# sorted_posts.each do |post|
		# 	if post.sponsored
		# 		puts "*********#{post.title}*****"
		# 		puts "**************"
		# 		puts post.text
		# 		puts "--------------"
		# 	else
		# 		puts post.title
		# 		puts "**************"
		# 		puts post.text
		# 		puts "--------------"
		# 	end
		# end
		threes = sorted_posts.each_slice(3).to_a
		# binding.pry
		user_order = ''
		while(user_order != 'exit')
			require 'colorize'
			if @index == 0
				@index = user_order.to_i - 1
			else
				@index = user_order.to_i - 1
			end
			threes[@index].each do |post|
				if post.sponsored
					puts "*********#{post.title}*****"
					puts "**************"
					puts post.text
					puts "--------------"
				else
					puts post.title
					puts "**************"
					puts post.text
					puts "--------------"

				end
			end
			threes.each_with_index do |posts, page| 
				if @index  == page 
					print (page+1).to_s.colorize(:red) + " "
				else
					print (page+1).to_s + " "
				end
			end
			user_order = gets.chomp
		end
		# threes[@index+1].each do |post|
		# 	if post.sponsored
		# 		puts "*********#{post.title}*****"
		# 		puts "**************"
		# 		puts post.text
		# 		puts "--------------"
		# 	else
		# 		puts post.title
		# 		puts "**************"
		# 		puts post.text
		# 		puts "--------------"
		# 	end
		# end
		# gets.chomp
		# threes[@index+2].each do |post|
		# 	if post.sponsored
		# 		puts "*********#{post.title}*****"
		# 		puts "**************"
		# 		puts post.text
		# 		puts "--------------"
		# 	else
		# 		puts post.title
		# 		puts "**************"
		# 		puts post.text
		# 		puts "--------------"
		# 	end
		# end
	end
end


blog = Blog.new
blog.add_post Post.new("Post-1", 1, "alskdjfalksdjfalskdjflsdj")
blog.add_post Post.new("Post-2", 2, "alskdjfalksdjfalskdjflsdj", true)
blog.add_post Post.new("Post-3", 3, "alskdjfalksdjfalskdjflsdj")
blog.add_post Post.new("Post-4", 4, "alskdjfalksdjfalskdjflsdj")
blog.add_post Post.new("Post-5", 5, "alskdjfalksdjfalskdjflsdj", true)
blog.add_post Post.new("Post-6", 6, "alskdjfalksdjfalskdjflsdj")
blog.add_post Post.new("Post-7", 7, "alskdjfalksdjfalskdjflsdj")
blog.add_post Post.new("Post-8", 8, "alskdjfalksdjfalskdjflsdj", true)


blog.publish_front_page
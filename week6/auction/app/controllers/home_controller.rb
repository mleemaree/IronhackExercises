class HomeController < ApplicationController
	def index
		@name = current_user ? @current_user.name : "Customer!"
	end
end

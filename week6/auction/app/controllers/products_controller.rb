class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find_by(id: params[:id])
		@customer = Customer.find_by(email: current_user.email)
	end
	
	def create
	end

	def destroy
		@product = Product.find_by(id: params[:id])
		@product.destroy
		redirect_to :back
	end

end

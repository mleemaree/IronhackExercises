class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find_by(id: params[:id])
	end

	def list
		customers = Customer.all
		render json: customers
	end

	def create
		customer = Customer.create(name: params[:name], email: params[:email])
	end

	def destroy
		customer = Customer.find_by(id: params[:id])
		customer.destroy
		redirect_to '/customers'
	end
end

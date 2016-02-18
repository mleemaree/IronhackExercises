class BidsController < ApplicationController

	def new
		@bid = Bid.new
	end

	def create
		@bids = Bid.all
		@bid = Bid.new bid_params
		product_id = @bids.where(:product_id => @bid.product_id)
		if product_id.all? { |b| b.amount < @bid.amount }
			@bid.save
		end
		redirect_to :back
	end

	private

	def bid_params
		params.require(:bid).permit(:amount, :customer_id, :product_id)
	end

end

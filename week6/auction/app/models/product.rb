class Product < ActiveRecord::Base
	belongs_to :customer
	has_many :bids
	has_many :reviews
	after_initialize :init 

	def init
		self.deadline = Time.now + 10.days
	end


end

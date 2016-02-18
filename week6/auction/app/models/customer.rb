class Customer < ActiveRecord::Base
  has_many :products
  has_many :bids
  has_many :reviews
  belongs_to :user
  validates :email, presence:true, uniqueness:true
  # after_initialize :give_id

  # def give_id
  # 	if current_user == undefined
  # 	if && self.user_id == nil
  # 		self.user_id = current_user.id
  # 	end

  # end

end

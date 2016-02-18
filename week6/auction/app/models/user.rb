class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :customer
  after_initialize :create_customer, :give_id


  def create_customer
  	@new_customer = Customer.create(email: self.email, user_id: self.id, name: self.name)
  end

  def give_id
    if @new_customer.user_id == nil
      @new_customer.user_id = self.id
    end
    if self.customer_id == nil
      self.customer_id = @new_customer.id
    end
  end

end

class AddMinbidToProducts < ActiveRecord::Migration
  def change
    add_column :products, :min_bid, :string
  end
end

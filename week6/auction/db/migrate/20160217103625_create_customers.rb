class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :name
      t.references :products, index:true
      t.references :bids, index:true
      t.references :user, index:true
      t.references :reviews, index:true
      t.timestamps null: false
    end
  end
end

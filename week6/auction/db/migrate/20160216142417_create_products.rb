class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.references :customer, index: true
      t.references :bids, index:true
      t.references :reviews, index:true
      t.timestamps null: false
    end
  end
end

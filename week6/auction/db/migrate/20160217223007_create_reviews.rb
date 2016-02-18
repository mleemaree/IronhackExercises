class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.references :product, index:true
      t.references :customer, index:true
      t.timestamps null: false
    end
  end
end

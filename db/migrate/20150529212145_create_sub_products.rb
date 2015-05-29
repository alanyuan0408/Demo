class CreateSubProducts < ActiveRecord::Migration
  def change
    create_table :sub_products do |t|
      t.belongs_to :product, index:true
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end

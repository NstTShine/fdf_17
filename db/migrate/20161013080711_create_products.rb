class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.int :category_id
      t.float :price
      t.string :description
      t.string :image
      t.int :quantity
      t.float :rate

      t.timestamps null: false
    end
  end
end

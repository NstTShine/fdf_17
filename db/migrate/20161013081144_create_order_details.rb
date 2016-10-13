class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.int :product_id
      t.int :order_id
      t.int :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end

class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title_name
      t.int :user_id
      t.int :status
      t.float :total_money

      t.timestamps null: false
    end
  end
end

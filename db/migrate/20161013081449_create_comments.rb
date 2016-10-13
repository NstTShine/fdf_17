class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.int :user_id
      t.int :product_id
      t.string :content
      t.int :rate

      t.timestamps null: false
    end
  end
end

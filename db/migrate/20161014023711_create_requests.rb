class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :title_name
      t.string :content
      t.integer :status

      t.timestamps null: false
    end
  end
end

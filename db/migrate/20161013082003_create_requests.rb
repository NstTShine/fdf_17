class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.int :user_id
      t.string :title_name
      t.string :content
      t.int :status

      t.timestamps null: false
    end
  end
end

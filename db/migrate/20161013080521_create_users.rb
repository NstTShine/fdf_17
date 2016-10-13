class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.datetime :dateofbirth
      t.string :address
      t.string :phone_number
      t.int :role

      t.timestamps null: false
    end
  end
end

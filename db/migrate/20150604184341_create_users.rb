class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :phone
      t.string :email
      t.timestamps null: false
    end
  end
end

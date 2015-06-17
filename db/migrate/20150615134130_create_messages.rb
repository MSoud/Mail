class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.integer :reciever
      t.text :content
      t.timestamps null: false
    end
  end
end

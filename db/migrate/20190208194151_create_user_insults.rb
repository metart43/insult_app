class CreateUserInsults < ActiveRecord::Migration[5.2]
  def change
    create_table :user_insults do |t|
      t.integer :victim_id
      t.integer :insult_id

      t.timestamps
    end
  end
end

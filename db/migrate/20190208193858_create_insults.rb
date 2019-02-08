class CreateInsults < ActiveRecord::Migration[5.2]
  def change
    create_table :insults do |t|
      t.text :content
      t.integer :bully_id

      t.timestamps
    end
  end
end

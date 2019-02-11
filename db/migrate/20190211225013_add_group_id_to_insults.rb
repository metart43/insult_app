class AddGroupIdToInsults < ActiveRecord::Migration[5.2]
  def change
    add_column :insults, :group_id, :integer
  end
end

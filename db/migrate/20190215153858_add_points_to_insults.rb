class AddPointsToInsults < ActiveRecord::Migration[5.2]
  def change
    add_column :insults, :points, :integer
  end
end

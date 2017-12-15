class AddIndexToStartPoint < ActiveRecord::Migration[5.1]
  def change
    add_index :start_points, :station
  end
end

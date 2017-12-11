class ModifyRideDateTime < ActiveRecord::Migration[5.1]
  def change
    remove_column :rides, :train_arrival_time
    remove_column :rides, :train_arrival_date
    add_column :rides, :train_arrival_at, :datetime
  end
end

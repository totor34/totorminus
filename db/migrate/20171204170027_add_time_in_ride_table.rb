class AddTimeInRideTable < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :train_arrival_time, :time
  end
end

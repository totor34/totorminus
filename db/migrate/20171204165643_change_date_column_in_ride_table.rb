class ChangeDateColumnInRideTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :rides, :train_arrival_time, :train_arrival_date
  end
end

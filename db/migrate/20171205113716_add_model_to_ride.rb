class AddModelToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :car_brand, :string
    add_column :rides, :car_model, :string
  end
end

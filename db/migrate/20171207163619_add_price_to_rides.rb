class AddPriceToRides < ActiveRecord::Migration[5.1]
  def change
    add_monetize :rides, :price, currency: { present: false }
    add_column :rides, :remaining_seats, :integer
  end
end

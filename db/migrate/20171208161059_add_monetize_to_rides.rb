class AddMonetizeToRides < ActiveRecord::Migration[5.1]
  def change
     add_monetize :rides, :amount
  end
end

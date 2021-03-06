class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :ride, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :passenger_number

      t.timestamps
    end
  end
end

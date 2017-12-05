class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :train_ref
      t.time :train_arrival_time
      t.date :train_arrival_time
      t.references :user, foreign_key: true
      t.integer :passengers_allowed
      t.references :start_point, foreign_key: true
      t.references :end_point, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end

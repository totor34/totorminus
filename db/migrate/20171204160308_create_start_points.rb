class CreateStartPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :start_points do |t|
      t.string :station
      t.float :long
      t.float :lat

      t.timestamps
    end
  end
end

class CreateEndPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :end_points do |t|
      t.string :address
      t.float :long
      t.float :lat

      t.timestamps
    end
  end
end

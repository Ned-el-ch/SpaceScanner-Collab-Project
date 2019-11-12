class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :destination_id
      t.integer :origin_id
      t.integer :rocket_id
      t.integer :carrier_id
      t.datetime :takeoff_time

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.integer :rating
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end

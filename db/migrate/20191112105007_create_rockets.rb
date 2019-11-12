class CreateRockets < ActiveRecord::Migration[6.0]
  def change
    create_table :rockets do |t|
      t.string :nickname
      t.integer :speed
      t.integer :passenger_capacity
      t.string :ship_model_name

      t.timestamps
    end
  end
end

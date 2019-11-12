class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :distance_from_earth
      t.integer :gravity
      t.string :hostility
      t.integer :population
      t.boolean :breathable_atmosphere

      t.timestamps
    end
  end
end

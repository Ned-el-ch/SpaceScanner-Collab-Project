class AddColumnToTrip < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :price, :integer
  end
end

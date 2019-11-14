class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sparklegasm, :integer
  end
end

class AddLocationHistoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location_history, :jsonb
  end
end

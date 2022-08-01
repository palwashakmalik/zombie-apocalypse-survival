class AddLocationHistoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :locationhistory, :jsonb
  end
end

class AddUserToTrade < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :sender_id, :bigint
    add_column :trades, :receiver_id, :bigint
    add_index :trades, :sender_id
    add_index :trades,   :receiver_id
    add_foreign_key :trades, :users, column: :receiver_id
    add_foreign_key :trades, :users, column: :sender_id
  end
end

class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :status, default: 0
      t.bigint :sender_id,  null: false
      t.bigint :receiver_id,  null: false
      t.index :sender_id
      t.index :receiver_id
      t.foreign_key :users, column: :receiver_id
      t.foreign_key :users, column: :sender_id
      t.timestamps
    end
  end
end

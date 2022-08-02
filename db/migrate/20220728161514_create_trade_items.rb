class CreateTradeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_items do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end

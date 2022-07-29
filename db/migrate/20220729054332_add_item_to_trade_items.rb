class AddItemToTradeItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :trade_items, :item, foreign_key: true
  end
end

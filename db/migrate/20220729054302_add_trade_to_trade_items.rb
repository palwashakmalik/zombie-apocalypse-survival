class AddTradeToTradeItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :trade_items, :trade, foreign_key: true
  end
end

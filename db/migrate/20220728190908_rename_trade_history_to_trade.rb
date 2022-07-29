class RenameTradeHistoryToTrade < ActiveRecord::Migration[5.2]
  def change
    rename_table :trade_histories, :trades
  end
end

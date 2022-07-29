class CreateTradeHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_histories do |t|
      t.string :status

      t.timestamps
    end
  end
end

class CreateTradeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_items do |t|
      t.integer :quantity, default: 0
<<<<<<< HEAD
      t.references :trade
      t.references :item,  index: true
=======
>>>>>>> e88c642 (Deleted files and update migrations)

      t.timestamps
    end
  end
end

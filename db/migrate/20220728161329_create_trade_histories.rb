class CreateTradeHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :status

      t.timestamps
    end
  end
end

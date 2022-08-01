class ChangeStatusInTrades < ActiveRecord::Migration[5.2]
  def up
    change_column :trades, :status, :integer, using: 'status::integer'
  end

  def down
    change_column :trades, :status, :string
  end
end

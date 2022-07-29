class RemoveQuantityFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :quantity
  end

  def down
    add_column :items, :quantity, :integers
  end
end

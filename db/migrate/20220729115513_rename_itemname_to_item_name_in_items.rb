class RenameItemnameToItemNameInItems < ActiveRecord::Migration[5.2]
  def up
    rename_column :items, :itemname, :item_name
  end

  def down
    rename_column :items, :item_name, :itemname
  end
end

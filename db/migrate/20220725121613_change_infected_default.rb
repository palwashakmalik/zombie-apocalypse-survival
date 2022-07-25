class ChangeInfectedDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :infected, :boolean, default: false
  end

  def down
    change_column :users, :infected, :boolean, default: nil
  end
end

class ChangeInfectedInUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :infected, :boolean, using: 'infected::boolean'
  end

  def down
    change_column :users, :infected, :integer
  end
end

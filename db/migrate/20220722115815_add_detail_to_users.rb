class AddDetailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, presence: true, default: ''
    add_column :users, :age, :integer, default: 18
    add_column :users, :gender, :integer, default: 1
    add_column :users, :infected, :boolean, default: false
  end
end

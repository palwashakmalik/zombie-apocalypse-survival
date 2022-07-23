class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :itemname
      t.integer :quantity
      t.integer :points

      t.timestamps
    end
  end
end

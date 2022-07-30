class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :itemname, presence: true
      t.integer :points, presence: true

      t.timestamps
    end
  end
end

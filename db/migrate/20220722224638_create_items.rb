class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :itemname, presence: true, default: ''
      t.integer :points, presence: true, default: 0

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, presence: true, default: ''
      t.integer :points, presence: true, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

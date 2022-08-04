# frozen_string_literal: true

class AddDetailToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :name, presence: true, default: ''
      t.integer :age, default: 18
      t.integer :gender, default: 1
      t.boolean :infected, default: false
      t.jsonb :location_history
    end
  end
end

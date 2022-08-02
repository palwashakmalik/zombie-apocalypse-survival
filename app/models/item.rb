class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :item_name, presence: true
end

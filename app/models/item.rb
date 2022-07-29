class Item < ApplicationRecord
  belongs_to :user, optional: true

  has_many :trade_items
  has_many :trades, through: :trade_items

  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :item_name, presence: true
  has_many :trade_items
  has_many :trades, through: :trade_items
end

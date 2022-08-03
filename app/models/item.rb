class Item < ApplicationRecord
  belongs_to :user, optional: true

<<<<<<< HEAD
  has_many :trade_items
  has_many :trades, through: :trade_items

  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :item_name, presence: true
=======
>>>>>>> e88c642 (Deleted files and update migrations)
  has_many :trade_items
  has_many :trades, through: :trade_items

  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :item_name, presence: true
end

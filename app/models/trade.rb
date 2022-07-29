class Trade < ApplicationRecord
  belongs_to :receiver, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  has_many :trade_items
  has_many :items, through: :trade_items
  accepts_nested_attributes_for :trade_items, allow_destroy: true, reject_if: :all_blank

end

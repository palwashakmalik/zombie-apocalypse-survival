# frozen_string_literal: true

class Trade < ApplicationRecord
  belongs_to :receiver, class_name: :User
  belongs_to :sender, class_name: :User

  has_many :trade_items, dependent: :delete_all
  has_many :items, through: :trade_items

  accepts_nested_attributes_for :trade_items, allow_destroy: true, reject_if: :all_blank

  scope :sender_receiver_trades, ->(user_id) { where('sender_id = ? OR receiver_id = ?', user_id, user_id) }

  enum status: { pending: 1, rejected: 2, cancelled: 3, accepted: 4 }

  def accept
    trade_items.includes(:item).find_each do |item|
      Item.find_by(id: item.item_id).user_id == receiver_id ? item.update(user_id: sender_id) : item.update(user_id: receiver_id)
    end
    accepted!
  end
end

# frozen_string_literal: true

module ApplicationHelper
  def items_filter(items)
    JSON.parse(items.to_json).to_a.filter do |item|
      item if item[1]['item_id'].present? && item[1]['quantity'].to_i.nonzero?
    end
  end

  def points_calculator(items)
    points = 0
    items.each do |item|
      points += Item.find_by(id: item[1]['item_id'].to_i).points * item[1]['quantity'].to_i
    end

    points
  end

  def sender?(trade, current_user)
    current_user.id == trade.sender_id
  end

  def check_status(trade)
    trade.pending? && !trade.accepted?
  end
end

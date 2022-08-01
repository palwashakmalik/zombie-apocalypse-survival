module ApplicationHelper
  def location_array(arr)
    return arr if arr.is_a?(Array)

    [arr]
  end

  def items_filter(items)
    JSON.parse(items.to_json).to_a.filter do |item|
      item if item[1]['item_id'].present? && item[1]['quantity'].to_i.nonzero?
    end
  end

  def points_calculator(items)
    points = 0
    items.each do |item|
      points += Item.find(item[1]['item_id'].to_i).points * item[1]['quantity'].to_i
    end

    points
  end

  def check_role(trade, current_user)
    return true if current_user.id == trade.sender_id

    false
  end

  def check_status(trade)
   return true if trade.pending? && !trade.accepted?

   false
  end
end

# frozen_string_literal: true

module Trader
  extend ActiveSupport::Concern

  def trade_initializer
    sender_items = helpers.items_filter(trade_create_params[:sender_items])
    receiver_items = helpers.items_filter(trade_create_params[:receiver_items])
    sender_total = helpers.points_calculator(sender_items)
    receiver_total = helpers.points_calculator(receiver_items)
    trade_items = sender_items + receiver_items
    return trade_items if receiver_total == sender_total
  end
end

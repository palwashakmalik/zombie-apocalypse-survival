# frozen_string_literal: true

class TradesController < ApplicationController
  before_action :set_user,:trade_params

  def new
    @sender_items = current_user.items
    @receiver_items = @user.items
    @trade = Trade.new(receiver_id: @user.id, sender_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
  def trade_params
    params.permit(:id, :user_id,trade_items_attributes: %i[id quantity _destroy])
  end
end

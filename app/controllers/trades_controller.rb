# frozen_string_literal: true

class TradesController < ApplicationController
  before_action :set_user, :trade_params, except: :update
  before_action :set_trade, only: :update

  def index
    @trades = Trade.where('sender_id = ? OR receiver_id = ?', current_user.id, current_user.id)
  end

  def new
    @sender_items = current_user.items
    @receiver_items = @user.items
    @trade = Trade.new(receiver_id: @user.id, sender_id: current_user.id)
  end

  def update
    @trade.status = params[:status].to_i
    @trade.accept if @trade.accepted?
    @trade.save
    redirect_to user_trades_path(current_user)
  end

  def create
    sender_items = helpers.items_filter(params[:trade][:sender_items])
    receiver_items = helpers.items_filter(params[:trade][:receiver_items])
    sender_total = helpers.points_calculator(sender_items)
    receiver_total = helpers.points_calculator(receiver_items)
    trade_items = sender_items + receiver_items
    if receiver_total == sender_total
      @trade = Trade.create(status: 1, receiver_id: params[:trade][:receiver_id],
                            sender_id: params[:trade][:sender_id], trade_items_attributes: trade_items.to_h)
      redirect_to user_trades_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_trade
    @trade = Trade.find(params[:id])
  end

  def trade_params
    params.permit(:id, :user_id)
  end
end

# frozen_string_literal: true

class TradesController < ApplicationController
  before_action :set_user, :trade_params, except: :update
  before_action :set_trade, only: :update
  def index
    @trades = Trade.sender_receiver_trades(current_user.id)
    authorize @trades
  end

  def new
    @sender_items = get_sender_items(current_user)
    @receiver_items = get_receiver_items
    @trade = Trade.new(receiver_id: @user.id, sender_id: current_user.id)
    authorize @trade
  end

  def update
    authorize @trade
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
      authorize @trade
      redirect_to user_trades_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_trade
    @trade = Trade.find(params[:id])
    authorize @trade
  end

  def trade_params
    params.permit(:id, :user_id)
  end

  private

  def get_sender_items(current_user)
    @sender_items = current_user.items
  end

  def get_receiver_items
    @receiver_items = @user.items
  end
end

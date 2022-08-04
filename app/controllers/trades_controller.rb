# frozen_string_literal: true

class TradesController < ApplicationController
  include Trader

  before_action :set_user, :trade_params, except: :update
  before_action :set_trade, only: :update
  def index
    @trades = Trade.sender_receiver_trades(current_user.id)
    authorize @trades
  end

  def new
    @sender_items = read_sender_items(current_user)
    @receiver_items = read_receiver_items
    @trade = Trade.new(receiver_id: @user.id, sender_id: current_user.id)
    authorize @trade
  end

  def update
    authorize @trade
    @trade.status = params[:status].to_i
    @trade.accept if @trade.accepted?
    if @trade.save
      redirect_to user_trades_path(current_user)
    else
      flash[:alert] = "Trade couldn't be save"
    end
  end

  def create
    trade_items = trade_initializer

    return unless trade_items

    @trade = Trade.create(status: 1, receiver_id: trade_create_params[:receiver_id],
                            sender_id: trade_create_params[:sender_id], trade_items_attributes: trade_items.to_h)
    authorize @trade
    redirect_to user_trades_path(current_user)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_trade
    @trade = Trade.find_by(id: params[:id])
    authorize @trade
  end

  def trade_params
    params.permit(:id, :user_id)
  end

  def trade_create_params
    params.require(:trade).permit(:id, :sender_id, :receiver_id,
                                  sender_items: %i[item_id quantity],
                                  receiver_items: %i[item_id quantity])
  end

  private

  def read_sender_items(current_user)
    @sender_items = current_user.items
  end

  def read_receiver_items
    @receiver_items = @user.items
  end
end

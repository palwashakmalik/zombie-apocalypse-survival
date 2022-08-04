# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def upvote
    authorize current_user
    @user.upvote_from current_user if @user.get_upvotes.size < FLAG_LIMIT
    if @user.get_upvotes.size == FLAG_LIMIT
      @user.infected = true
      @user.save
      flash[:alert] = "Trade couldn't be save" unless @user.save
    end
    redirect_to root_path
  end

  def show
    @items = @user.items
    authorize @user
  end

  def downvote
    @user.downvote_from current_user unless @user.infected
    authorize current_user
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by(id: user_params[:id])
  end

  def user_params
    params.permit(:id)
  end
end

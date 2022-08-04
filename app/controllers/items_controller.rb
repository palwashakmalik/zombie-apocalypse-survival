class ItemsController < ApplicationController
  before_action :set_user, only: :index
  def index
    @items = @user.items
    authorize @items
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

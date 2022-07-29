class ItemsController < ApplicationController
  before_action :set_user
  def index
    @items = @user.items
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

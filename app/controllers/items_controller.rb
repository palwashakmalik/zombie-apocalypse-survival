class ItemsController < ApplicationController
<<<<<<< HEAD
  before_action :set_user, only: :index

=======
  before_action :set_user
>>>>>>> 4c012a9 (created models and views for trading)
  def index
    @items = @user.items
  end

<<<<<<< HEAD
  private

=======
>>>>>>> 4c012a9 (created models and views for trading)
  def set_user
    @user = User.find(params[:user_id])
  end
end

class UsersController < ApplicationController
  before_action :find_user

  def upvote
    @user.upvote_from current_user if @user.get_upvotes.size < 5
    if @user.get_upvotes.size == 5
      @user.infected = true
      @user.save
    end
    redirect_to root_path
  end

  def show
    @items = @user.items
  end

  def downvote
    @user.downvote_from current_user unless @user.infected
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find_by(user_params)
  end

  def user_params
    params.permit(:id)
  end
end

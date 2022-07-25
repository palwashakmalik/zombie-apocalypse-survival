class UsersController < ApplicationController
  before_action :find_user

  def upvote
<<<<<<< HEAD
    @user.upvote_from current_user if @user.get_upvotes.size < 5
    if @user.get_upvotes.size == 5
      @user.infected = true
      @user.save
    end
    redirect_to root_path
  end

=======
    @user = User.find(params[:id])
    @user.upvote_from current_user if @user.get_upvotes.size < 5
    byebug
    if @user.get_upvotes.size == 5
      @user.infected = true
      @user.save
    end
    redirect_to root_path
  end
>>>>>>> d8d9f23 (Gem as_votable Used)
  def show
    @items = @user.items
  end

  def downvote
<<<<<<< HEAD
=======
    @user = User.find(params[:id])
>>>>>>> d8d9f23 (Gem as_votable Used)
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
<<<<<<< HEAD
=======


>>>>>>> d8d9f23 (Gem as_votable Used)
end

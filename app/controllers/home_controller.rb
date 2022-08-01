class HomeController < ApplicationController
<<<<<<< HEAD
  def index
    @users = User.all_users_accept_current(current_user)
  end
=======
def index
  @users = User.where.not(id: current_user.id) if current_user
end

>>>>>>> 7ef9055 (Gem as_votable Used)
end

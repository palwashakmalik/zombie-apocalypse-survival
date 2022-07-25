class HomeController < ApplicationController
<<<<<<< HEAD
  def index
<<<<<<< HEAD
    @users = User.all_users_accept_current(current_user) if current_user
=======
    @users = User.where.not(id: current_user.id) if current_user
>>>>>>> 4f60fa3 (fixed pr issues)
  end
=======
def index
  @users = User.where.not(id: current_user.id) if current_user
end

>>>>>>> 7ef9055 (Gem as_votable Used)
end

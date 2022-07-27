class HomeController < ApplicationController
  def index
<<<<<<< HEAD
    @users = User.all_users_accept_current(current_user) if current_user
=======
    @users = User.where.not(id: current_user.id) if current_user
>>>>>>> 4f60fa3 (fixed pr issues)
  end
end

class HomeController < ApplicationController
  def index
    @users = User.all_users_accept_current(current_user)
  end
end

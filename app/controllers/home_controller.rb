class HomeController < ApplicationController
  def index
    @users = User.not_user(current_user) if current_user
  end
end

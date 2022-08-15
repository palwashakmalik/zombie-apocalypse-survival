# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @users = User.all_users_accept_current(current_user.id) if current_user
  end
end

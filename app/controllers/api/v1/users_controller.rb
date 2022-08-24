# frozen_string_literal: true

module Api::V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    def index
      @users = User.all

      render json: @users
    end
  end
end

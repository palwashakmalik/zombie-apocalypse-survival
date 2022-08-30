# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all

        render json: UserSerializer.new(users).to_serialized_json
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_user, only: :index
      def index
        items = @user.items
        render json: items
      end

      private

      def set_user
        @user = User.find_by(id: params[:user_id])
      end
    end
  end
end

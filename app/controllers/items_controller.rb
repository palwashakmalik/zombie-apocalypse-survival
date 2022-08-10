# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_user, only: :index
  def index
    @items = @user.items
    authorize @items
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
    authorize :item, :access?
    raise ActiveRecord::RecordNotFound if @user.nil?
  end
end

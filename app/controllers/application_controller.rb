# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  #before_action :authenticate_user!
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :age, :gender, :infected, :avatar, location_history:
               %i[longitude latitude created_at], items_attributes: %i[id points item_name _destroy])
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:avatar, location_history: %i[longitude latitude created_at])
    end
  end

  private

  def record_not_found
    render file: 'public/404'
  end
end

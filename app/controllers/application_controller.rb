class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :age, :gender, :infected, :avatar,
               items_attributes: %i[id points itemname quantity _destroy], locations_attributes: %i[latitude longitude])
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:avatar, locations_attributes: %i[id latitude longitude])
    end
  end
end

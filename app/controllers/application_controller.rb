class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :age, :gender, :infected, :avatar, locationhistory: [:longitude, :latitude, :created_at],
              items_attributes: %i[id points item_name _destroy])
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:avatar, locationhistory: [:longitude, :latitude, :created_at])
    end
  end
end

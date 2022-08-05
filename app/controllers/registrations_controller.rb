# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!
  def update_resource(resource, params)
    if @user.location_history
      locations = [] << @user.location_history << params[:location_history]
      params[:location_history] = locations.flatten
    end
    resource.update(params)
  end
end

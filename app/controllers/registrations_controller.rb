# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  def update_resource(resource, params)
    if @user.location_history
      locations = []
      locations.push(@user.location_history)
      locations.push(params[:location_history])
      params[:location_history] = locations.flatten
    end
    resource.update(params)
  end
end

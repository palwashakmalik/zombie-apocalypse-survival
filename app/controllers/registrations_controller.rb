# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def edit
    @location = resource.locations.new
    render :edit
  end

  def update_resource(resource, params)
    if(@user.locationhistory)
      locations = []
      locations.push(@user.locationhistory)
      locations.push(params[:locationhistory])
      params = {locationhistory: locations.flatten}
    end
    resource.update(params)
  end
end

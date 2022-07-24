# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def edit
    @location = resource.locations.new
    render :edit
  end

  def update_resource(resource, params)
    resource.update(params)
  end

end

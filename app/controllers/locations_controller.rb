class LocationsController < ApplicationController
  def index
    @locations = current_user.locations.order('created_at DESC')
  end
end

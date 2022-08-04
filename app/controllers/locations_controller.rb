class LocationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @location_history = current_user.location_history
  end
end

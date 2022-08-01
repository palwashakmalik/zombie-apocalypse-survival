class LocationsController < ApplicationController
  def index
    @locationhistory = current_user.locationhistory
  end
end

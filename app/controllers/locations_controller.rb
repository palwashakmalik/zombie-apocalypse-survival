# frozen_string_literal: true

class LocationsController < ApplicationController
  def index
    @location_history = current_user.location_history
  end
end

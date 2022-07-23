class LocationsController
  def index
    @locations = Location.all.order('created_at DESC')
  end



end

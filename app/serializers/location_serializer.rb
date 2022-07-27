class LocationSerializer < ActiveModel::Serializer
  attributes :id, :longitude,:latitude,:user_id
end

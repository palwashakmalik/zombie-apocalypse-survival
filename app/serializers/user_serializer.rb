# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :name, :id, :location_history, :gender, :email, :age
end

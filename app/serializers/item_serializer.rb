# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :item_name, :points
end

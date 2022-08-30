# frozen_string_literal: true

class ItemSerializer
  def initialize(item)
    @item = item
  end

  def to_serialized_json
    @item.to_json(except: %i[created_at updated_at user_id])
  end
end

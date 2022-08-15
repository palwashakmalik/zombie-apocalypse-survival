# frozen_string_literal: true

module LocationHelper
  def location_array(arr)
    return arr if arr.is_a?(Array)

    [arr]
  end
end

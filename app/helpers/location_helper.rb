module LocationHelper
  def location_array(arr)
    return arr if arr.kind_of?(Array)

    return [arr]
  end
end

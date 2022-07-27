module ApplicationHelper
  def last_location(arr)
    return arr.last if arr.kind_of?(Array)

    return arr
 end
end

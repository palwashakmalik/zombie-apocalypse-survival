module ApplicationHelper
  def image_helper(image)
    image&.attached? ? image : 'default.jpeg'
  end
  def last_location(arr)
    return arr.last if arr.kind_of?(Array)

    return arr
 end
end

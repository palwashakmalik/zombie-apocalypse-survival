
module ApplicationHelper
  def image_helper(image)
    image&.attached? ? image : 'default.jpeg'
  end
end

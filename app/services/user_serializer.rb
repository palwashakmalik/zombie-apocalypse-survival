# frozen_string_literal: true

class UserSerializer
  def initialize(user)
    @user = user
  end

  def to_serialized_json
    @user.to_json(except: %i[created_at updated_at infected admin])
  end
end

class ItemPolicy < ApplicationPolicy

  def index?
    !user.admin?
  end
end

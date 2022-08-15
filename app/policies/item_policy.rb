# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  def index?
    !user.admin?
  end

  def access?
    !user.admin?
  end
end

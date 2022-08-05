# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  def index?
    return true unless user.admin?
  end
end

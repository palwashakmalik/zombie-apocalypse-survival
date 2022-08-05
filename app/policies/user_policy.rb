# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def upvote?
    return true unless user.admin?
  end

  def show?
    return true unless user.admin?
  end

  def downvote?
    return true unless user.admin?
  end
end

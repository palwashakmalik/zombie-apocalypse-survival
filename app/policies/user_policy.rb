class UserPolicy < ApplicationPolicy

  def upvote?
    !user.admin?
  end
  def show?
    !user.admin?
  end
  def downvote?
    !user.admin?
  end

end

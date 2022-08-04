class TradePolicy < ApplicationPolicy

  def index?
    !user.admin?
  end
  def new?
    !user.admin?
  end
  def update?
    !user.admin?
  end
  def create?
    !user.admin?
  end
  def get_sender_items?
    !user.admin?
  end
  def get_receiver_items?
    !user.admin?
  end
  def set_trade?
    !user.admin?
  end
end

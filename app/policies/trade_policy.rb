# frozen_string_literal: true

class TradePolicy < ApplicationPolicy
  def index?
    return true unless user.admin?
  end

  def new?
    return true unless user.admin?
  end

  def update?
    return true unless user.admin?
  end

  def create?
    return true unless user.admin?
  end

  def get_sender_items?
    return true unless user.admin?
  end

  def get_receiver_items?
    return true unless user.admin?
  end

  def set_trade?
    return true unless user.admin?
  end
end

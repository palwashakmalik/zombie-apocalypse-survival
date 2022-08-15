# frozen_string_literal: true

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

  def set_trade?
    !user.admin?
  end
end

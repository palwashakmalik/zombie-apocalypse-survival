# frozen_string_literal: true

class User < ApplicationRecord
  scope :infected, -> { where(infected: 1).count.to_f }
  scope :not_infected, -> { where(infected: 0).count.to_f }
  devise :database_authenticatable, :registerable,
         :validatable, :rememberable

  acts_as_votable
  acts_as_voter

  has_one_attached :avatar

  has_many :items, inverse_of: :user, dependent: :delete_all

  scope :infected, -> { where(infected: 1).count.to_f }
  scope :not_infected, -> { where(infected: 0).count.to_f }
  scope :all_users_accept_current, ->(user_id) { where.not(id: user_id) }

  enum gender: { female: 1, male: 2, other: 3 }

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank

  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def with_item
    items.new if items.blank?
    self
  end

  def infected_percentage
    percentage(User.infected / User.all.count.to_f)
  end

  def non_infected_percentage
    percentage(User.not_infected / User.all.count.to_f)
  end

  def average_resources_values
    Item.group(:item_name).count.values.map! { |n| (n / User.all.count.to_f).round(3) }
  end

  def average_resources_keys
    Item.group(:item_name).count.keys
  end

  def points
    Item.where(user_id: User.where(infected: 1)).map(&:points).inject(:+)
  end

  def percentage(number)
    number.round(4) * 100
  end
end

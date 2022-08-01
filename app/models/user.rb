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
    percentage = percentage(infected_survivor_count / all_survivors_count)
  end

  def non_infected_percentage
    percentage(survivor_count / all_survivors_count)
  end

  def average_resources_values
    total_count = all_survivors_count
    Item.group(:itemname).count.values.map! { |n| (n/total_count).round(3) }
  end

  def average_resources_keys
    Item.group(:itemname).count.keys
  end

  def points
    Item.where(user_id: User.where(infected: 1)).map(&:points).inject(:+)
  end

  def percentage(number)
    number.round(4) * 100
  end

  def survivor_count
    User.not_infected
  end

  def infected_survivor_count
    User.infected
  end

  def all_survivors_count
    User.all.count.to_f
  end
end

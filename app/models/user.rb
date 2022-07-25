class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :validatable, :rememberable

<<<<<<< HEAD
=======
  has_one_attached :avatar
  has_many :locations, inverse_of: :user
  has_many :items, inverse_of: :user
  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :locations
  acts_as_votable
  acts_as_voter
>>>>>>> d8d9f23 (Gem as_votable Used)
  enum gender: { female: 1, male: 2, other: 3 }

  has_one_attached :avatar
  has_many :items, inverse_of: :user, dependent: :delete_all
  acts_as_votable
  acts_as_voter

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank

  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :all_users_accept_current, ->(current_user) { where.not(id: current_user.id) }

  def with_item
    items.new if items.blank?
    self
  end
end

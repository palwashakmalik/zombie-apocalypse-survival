class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :locations, inverse_of: :user
  has_many :items, inverse_of: :user
  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :locations

  enum gender: { female: 1, male: 2, other: 3 }
  def with_item_and_location
    items.new if locations.blank?
    locations.new if locations.blank?
    self
  end
end

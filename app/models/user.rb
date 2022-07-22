class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :validatable, :rememberable

  has_one_attached :avatar

  enum gender: { female: 1, male: 2, other: 3 }
end

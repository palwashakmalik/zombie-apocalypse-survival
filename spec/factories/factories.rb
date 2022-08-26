# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :item do
    item_name { Faker::Name.name }
    points { Faker::Number.non_zero_digit }
    user
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    admin { false }
    age { Faker::Number.non_zero_digit }
    gender { Faker::Number.between(from: 1, to: 3) }
    infected { false }
    location_history do
      { "latitude": Faker::Number.non_zero_digit, "longitude": Faker::Number.non_zero_digit, "created_at": Faker::Date }
    end
    password { Faker::Internet.password }
  end

  factory :trade do
    status { Faker::Number.between(from: 1, to: 4) }
    sender_id {}
    receiver_id {}
  end

  factory :trade_item do
    quantity { Faker::Number.non_zero_digit }
    item { FactoryBot.create(:item, user: user, points: 10) }
    trade
  end

  factory :vote do
    votable_type { Faker::Number.non_zero_digit }
    votable_id {}
    voter_type { Faker::Number.non_zero_digit }
    voter_id {}
    vote_flag { false }
    vote_scope { Faker::Number.non_zero_digit }
    vote_weight { Faker::Number.non_zero_digit }
  end
end

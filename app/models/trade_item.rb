# frozen_string_literal: true

class TradeItem < ApplicationRecord
  belongs_to :trade
  belongs_to :item
end

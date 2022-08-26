# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TradeItem, type: :model do
  let(:trade_item) { FactoryBot.build(:trade_item) }

  describe 'Association Test' do
    it { is_expected.to belong_to(:trade) }
    it { is_expected.to belong_to(:item) }
  end
end

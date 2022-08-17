# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.build(:item) }

  describe 'Association Test' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to have_many(:trade_items).dependent(:delete_all) }
    it { is_expected.to have_many(:trades).through(:trade_items) }
  end

  describe 'Validation Test' do
    it { is_expected.to validate_numericality_of(:points).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:points) }
    it { is_expected.to validate_presence_of(:item_name) }
  end
end

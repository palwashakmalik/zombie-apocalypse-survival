# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trade, type: :model do
  let(:trade) { FactoryBot.build(:trade) }

  describe 'Association Test' do
    it { is_expected.to have_many(:trade_items).dependent(:delete_all) }
    it { is_expected.to have_many(:items).through(:trade_items) }
    it { is_expected.to accept_nested_attributes_for(:trade_items).allow_destroy(true) }
    it { is_expected.to belong_to(:receiver).class_name(:User) }
    it { is_expected.to belong_to(:sender).class_name(:User) }
  end

  describe 'Enum Test' do
    it { is_expected.to define_enum_for(:status).with_values(pending: 1, rejected: 2, cancelled: 3, accepted: 4) }
  end
end

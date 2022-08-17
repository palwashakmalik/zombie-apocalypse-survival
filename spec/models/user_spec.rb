# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'Association Test' do
    it { is_expected.to have_many(:items).dependent(:delete_all) }
    it { is_expected.to have_one_attached(:avatar) }
    it { is_expected.to accept_nested_attributes_for(:items).allow_destroy(true) }
  end

  describe 'Validation Test' do
    it { is_expected.to validate_numericality_of(:age).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to define_enum_for(:gender).with_values(female: 1, male: 2, other: 3) }
    it { is_expected.to validate_presence_of(:email) }
  end

  it 'infected_percentage ' do
    value = user.send(:infected_percentage)
    expect(value).to be_kind_of(Float)
  end

  it 'non_infected_percentage ' do
    value = user.send(:non_infected_percentage)
    expect(value).to be_kind_of(Float)
  end

  it 'average_resources_values ' do
    value = user.send(:average_resources_values)
    expect(value).to be_kind_of(Array)
  end

  it 'average_resources_keys' do
    value = user.send(:average_resources_keys)
    expect(value).to be_kind_of(Array)
  end

  it 'points' do
    user.send(:points)
  end

  it 'with_item' do
    value = user.send(:with_item)
    expect(value).to be_an_instance_of(described_class)
  end
end

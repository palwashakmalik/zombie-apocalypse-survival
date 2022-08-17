# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'faker'

RSpec.describe 'Trades', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:current_user) { FactoryBot.create(:user) }

  describe 'GET' do
    it 'trade#index' do
      sign_in(user)
      get user_trades_path(current_user), params: { user_id: current_user.id }
      expect(response).to render_template('index')
    end

    it 'trade#new' do
      sign_in(user)

      get new_user_trade_path(current_user), params: { user_id: current_user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  # rubocop:disable RSpec/MultipleMemoizedHelpers
  describe 'PATCH trade#update' do
    let(:trade) { FactoryBot.create(:trade, sender_id: current_user.id, receiver_id: user.id) }
    let(:receiver_items) { FactoryBot.create(:item, user: user, points: 10) }
    let(:sender_items) { FactoryBot.create(:item, user: current_user, points: 20) }
    let(:receiver_trade_items) { FactoryBot.create(:trade_item, item: receiver_items, trade: trade) }
    let(:sender_trade_items) { FactoryBot.create(:trade_item, item: sender_items, trade: trade) }

    it 'trade.save is true' do
      sign_in(user)
      receiver_trade_items
      sender_trade_items
      patch trade_path(trade), params: { id: trade.id, status: 4 }
      expect(response).to redirect_to(user_trades_path(user))
    end

    it 'trade.save is false' do
      sign_in(user)
      allow(Trade).to receive(:find_by).and_return(trade)
      allow(trade).to receive(:save).and_return(false)
      patch trade_path(trade), params: { id: trade.id, status: 4 }
      expect(flash[:alert]).to be("Trade couldn't be save")
    end
  end

  describe 'POST trade#ceate' do
    let(:trade) { FactoryBot.create(:trade, sender_id: current_user.id, receiver_id: user.id) }
    let(:receiver_items) { FactoryBot.create(:item, user: user, points: 10) }
    let(:sender_items) { FactoryBot.create(:item, user: current_user, points: 20) }

    context 'when successful' do
      let(:params) do
        { id: trade.id, sender_id: current_user.id,
          receiver_id: user.id, sender_items: { '2' =>
        { item_id: sender_items.id, quantity: '1' } },
          receiver_items: { '2' => { item_id:
        receiver_items.id, quantity: '2' } } }
      end

      it 'Trade points are equal' do
        sign_in(current_user)
        post user_trades_path(current_user, trade), params: { trade: params }
        expect(response).to redirect_to(user_trades_path(current_user))
      end
    end

    context 'when fails' do
      let(:receiver_trade_items) { FactoryBot.create(:trade_item, item: receiver_items, trade: trade) }
      let(:sender_trade_items) { FactoryBot.create(:trade_item, item: sender_items, trade: trade) }
      let(:params) do
        { id: trade.id, sender_id: current_user.id,
          receiver_id: user.id, sender_items: { '2' =>
        { item_id: sender_items.id, quantity:
        sender_trade_items.quantity } }, receiver_items:
        { '2' => { item_id: receiver_items.id, quantity:
        receiver_trade_items.quantity } } }
      end

      it 'Trade points are not equal' do
        sign_in(current_user)
        post user_trades_path(current_user, trade), params: { trade: params }
        expect(response).to have_http_status(:no_content)
      end
    end
  end
  # rubocop:enable RSpec/MultipleMemoizedHelpers
end

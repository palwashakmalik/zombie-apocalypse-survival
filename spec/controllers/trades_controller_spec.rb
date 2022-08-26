# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'faker'

RSpec.describe 'Trades', type: :request do
  user = FactoryBot.create(:user)
  current_user = FactoryBot.create(:user)
  trade = FactoryBot.create(:trade, sender_id: current_user.id, receiver_id: user.id)
  let(:receiver_items) { FactoryBot.create(:item, user: user, points: 10) }
  let(:sender_items) { FactoryBot.create(:item, user: current_user, points: 20) }

  describe '#index' do
    it 'renders index page' do
      sign_in(user)
      get user_trades_path(current_user), params: { user_id: current_user.id }
      expect(response).to render_template('index')
    end
  end

  describe '#new' do
    it 'renders trade page' do
      sign_in(user)

      get new_user_trade_path(current_user), params: { user_id: current_user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#update' do
    context 'when successful' do
      let(:receiver_trade_items) { FactoryBot.create(:trade_item, item: receiver_items, trade: trade) }
      let(:sender_trade_items) { FactoryBot.create(:trade_item, item: sender_items, trade: trade) }

      it 'redirects to trades' do
        receiver_trade_items
        sender_trade_items
        sign_in(user)
        patch trade_path(trade), params: { id: trade.id, status: 4 }
        expect(response).to redirect_to(user_trades_path(user))
      end

      it 'trade.save is true' do
        receiver_trade_items
        sender_trade_items
        sign_in(user)
        patch trade_path(trade), params: { id: trade.id, status: 4 }
        expect(trade.save).to be(true)
      end
    end

    context 'when unsuccessful' do
      it 'shows a flash message' do
        sign_in(user)
        allow(Trade).to receive(:find_by).and_return(trade)
        allow(trade).to receive(:save).and_return(false)
        patch trade_path(trade), params: { id: trade.id, status: 4 }
        expect(flash[:alert]).to be("Trade couldn't be save")
      end

      it 'trade.save is false' do
        sign_in(user)
        allow(Trade).to receive(:find_by).and_return(trade)
        allow(trade).to receive(:save).and_return(false)
        patch trade_path(trade), params: { id: trade.id, status: 4 }
        expect(trade.save).to be(false)
      end
    end
  end

  describe '#ceate' do
    context 'when successful' do
      let(:params) do
        { id: trade.id, sender_id: current_user.id,
          receiver_id: user.id, sender_items: { '2' =>
        { item_id: sender_items.id, quantity: '1' } },
          receiver_items: { '2' => { item_id:
        receiver_items.id, quantity: '2' } } }
      end

      it 'trade points are equal ' do
        sign_in(current_user)
        post user_trades_path(current_user, trade), params: { trade: params }
        expect(response).to redirect_to(user_trades_path(current_user))
      end

      it 'database incremented by one entry' do
        sign_in(current_user)
        expect do
          post user_trades_path(current_user, trade), params: { trade: params }
        end.to change(Trade, :count).by(1)
      end
    end

    context 'when unsuccessful' do
      let(:params) do
        { id: trade.id, sender_id: current_user.id,
          receiver_id: user.id, sender_items: { '2' =>
        { item_id: sender_items.id, quantity:
          '1' } }, receiver_items:
        { '2' => { item_id: receiver_items.id, quantity:
          '3' } } }
      end

      it 'trade points are not equal' do
        sign_in(current_user)
        post user_trades_path(current_user, trade), params: { trade: params }
        expect(response).to have_http_status(:no_content)
      end

      it 'database count doesn\'t change' do
        sign_in(current_user)
        expect do
          post user_trades_path(current_user, trade), params: { trade: params }
        end.to change(Trade, :count).by(0)
      end
    end
  end
end

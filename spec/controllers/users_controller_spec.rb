# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'faker'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:current_user) { FactoryBot.create(:user) }

  it 'Sign In Ok' do
    sign_in(user)
    get root_path
    expect(CGI.unescape_html(response.body)).to include('Log Out')
  end

  describe '#upvote' do
    context 'when successful' do
      it 'valid survivor and votes is not equal to flag limit' do
        sign_in(current_user)
        put like_user_path(user, current_user), params: { id: user.id }
        expect(response).to redirect_to root_path
      end
    end

    context 'when unsuccessful' do
      before do
        allow(User).to receive(:find_by).and_return(user)
        allow(user).to receive(:save).and_return(false)
        # rubocop:disable RSpec/MessageChain
        allow(user).to receive_message_chain(:get_upvotes, :size).and_return(5)
        # rubocop:enable RSpec/MessageChain
      end

      it 'votes is equal to flag limit' do
        sign_in(current_user)
        put like_user_path(user, current_user), params: { id: user.id }
        expect(flash[:alert]).to match("flag couldn't be save")
      end
    end
  end

  describe '#downvote' do
    it 'unflags the survivor' do
      sign_in(current_user)
      put unlike_user_path(user, current_user), params: { id: user.id }
      expect(response).to redirect_to root_path
    end
  end
end

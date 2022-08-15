# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'
  resources :users do
    member do
      put 'like' => 'users#upvote'
      put 'unlike' => 'users#downvote'
    end
    resources :trades, except: :update
    resources :trade_items
    resources :items
  end
  resources :locations
  resources :trades, only: :update
end

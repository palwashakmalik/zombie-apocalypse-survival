Rails.application.routes.draw do
  resources :locations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'
  resources :users do
    member do
      put 'like' => 'users#upvote'
      put 'unlike' => 'users#downvote'
    end
    resources :trades
    resources :trade_items
    resources :items
  end
end

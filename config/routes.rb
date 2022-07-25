Rails.application.routes.draw do
  resources :locations
  resources :items
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'home#index'
  resources :users do
    member do
      put "like"=> "users#upvote"
      put "unlike"=> "users#downvote"
    end
  end

  resources :users do
  resources :items
  end
end

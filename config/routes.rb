Rails.application.routes.draw do
  resources :locations
  resources :items
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'home#index'
end

Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :guests
  resources :confirmations
  root to: 'guests#index'
end

Rails.application.routes.draw do

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'dashboard/items', to: 'dashboard#items', as: 'dashboard_items'

  devise_for :stores
  resource :search, only: :show
  resources :stores, only: :show
  resources :items
  resources :products, only: %i(index show)
  root 'pages#home'

  get 'styleguide', to: 'pages#style'
  get 'pages/dashboard'
  get 'pages/search'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

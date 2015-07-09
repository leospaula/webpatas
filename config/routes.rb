Rails.application.routes.draw do
  devise_for :stores
  resource :search, only: :show
  resources :stores, only: :show
  resources :items
  resources :products, only: %i(index show)
  root 'searches#show'

  get 'styleguide', to: 'pages#style'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

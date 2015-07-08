Rails.application.routes.draw do
  devise_for :stores
  root 'pages#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

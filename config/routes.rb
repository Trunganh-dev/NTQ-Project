Rails.application.routes.draw do


  get 'home/content'

  root 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :contents
end

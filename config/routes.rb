Rails.application.routes.draw do


  root 'home#index'
  delete '/logout',  to: 'sessions#destroy'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end

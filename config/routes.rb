Rails.application.routes.draw do


  root 'home#index'
  devise_for :users, :controllers => { 
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users
  resources :groups
  resource  :courses
end

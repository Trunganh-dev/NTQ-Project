Rails.application.routes.draw do

  get 'home/content'
  get "content/edit" => 'content#edit', :as => :edit
  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount Ckeditor::Engine => '/ckeditor'

  resources :contents
  resources :users
  resources :groups
  resource  :courses

end

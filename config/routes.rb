Rails.application.routes.draw do

  get 'home/content'
  get "content/edit" => 'content#edit', :as => :edit
  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  mount Ckeditor::Engine => '/ckeditor'

  resources :users
  resources :attendances
  resources :groups do
    resources :contents, except: [:show, :index]
  end
  resources :courses
  resources :members
end

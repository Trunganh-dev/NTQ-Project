Rails.application.routes.draw do

  get 'home/content'
  get "content/edit" => 'content#edit', :as => :edit
  get  '/set-captain',   to: 'roles#setCaptain',   as: "set_captain"
  get  '/set-mentor',    to: 'roles#setMentor' ,    as: "set_mentor"
  get  '/delete-mentor', to: 'roles#destroyMentor', as: "del_mentor"
  get  '/delete-member', to: 'roles#destroyMember', as: "del_member"
  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  mount Ckeditor::Engine => '/ckeditor'

  resources :users
  resources :attendances
  resources :groups do
    resources :contents, except: [:show, :index]
    resources :members
  end
  resources :courses
  resources :details
end

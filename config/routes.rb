Rails.application.routes.draw do
  resources :profiles
  resources :overviews
  resources :skills
  resources :educations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_scope :user do
    get '/login' => 'devise/sessions#new', as: :login
    get '/logout' => 'devise/sessions#destroy', as: :logout
    get '/profiles/:id/view_profiles' => 'profiles#view_profiles', as: :view_profiles
  end
  devise_for :users
  get 'root/index'
  root to: 'root#index'
end

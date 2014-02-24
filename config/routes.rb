Orlandoio::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "tags/:tags", to: "profile#index", as: :tag
  get "tags/", to: "profile#tags", as: :tags

  devise_for :users, controllers: { 
      omniauth_callbacks: "omniauth_callbacks",
      registrations: "users/registrations" }

  devise_scope :user do 
    match '/logout', to: 'users/sessions#destroy', via: [:get, :post]
  end 
  
  resources :users
  resources :profile
  
  get "/about", to: "static_pages#about"
  root "static_pages#home"

end

Rails.application.routes.draw do

  get 'comments/new'
  get 'comments/create'
  get 'comments/update'
  get 'comments/edit'
  get 'comments/destroy'
  get 'comments/index'
  get 'comments/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/update'
  get 'posts/edit'
  get 'posts/destroy'
  get 'posts/index'
  get 'posts/show'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  
  resources :users
  resources :posts do 
  	resources :comments
	end
  resources :sessions, only: [:new, :create, :destroy]


  get 'signup', to: 'users#new', as: 'signup'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  get 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

root 'home#index'

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  


end
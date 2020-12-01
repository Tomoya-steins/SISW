Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :events
  root 'users#top'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'signup_firm' => 'users#new_firm'
  post 'signup_firm' => 'users#create_firm'

  get 'signup_wait' => 'users#wait'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :account_activations, only: [:edit]

  resources :accounts

  resources :firms, only: [:index, :create, :destroy]
  
  resources :posts

  resources :personal, only: [:show, :edit, :update]

  resources :messages, only: [:create]

  resources :password_resets, only: [:new, :create, :edit, :update]

  namespace :api do
    get 'login' => 'login#show'
    end
end

Rails.application.routes.draw do
  root 'posts#index'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get 'forgot' => 'forgot_password#input'
  post 'forgot' => 'forgot_password#get'

  get ':id/change' => 'forgot_password#change'
  post ':id/change' => 'forgot_password#update'

  resources :account_activations, only: [:edit]

  resources :accounts
  
  resources :posts, only: [:index, :destroy, :new, :create]

  resources :personal, only: [:show, :edit, :update]

  namespace :api do
    get 'login' => 'login#show'
    resources :posts
  end
end

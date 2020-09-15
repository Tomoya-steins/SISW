Rails.application.routes.draw do
  root 'posts#index'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :accounts
  
  resources :posts

  namespace :api do
    get 'login' => 'login#show'
    resources :posts
  end
end

Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get  'withdrawal', to: 'withdrawal#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  
  resources :posts, only: [:show, :create, :edit, :update, :destroy]
end

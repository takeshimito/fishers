Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'rank', to: 'rank#index'

  get 'instruction', to: 'instruction#index'
  get 'policy', to: 'policy#index'
  get 'service', to: 'service#index'
  
  get  'withdrawal', to: 'withdrawal#index'
  
  get 'inquiries', to: 'inquiries#new'
  post 'inquiries', to: 'inquiries#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :likes
    end
  end
  
  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] 
  
  resources :favorites, only: [:create, :destroy]
end

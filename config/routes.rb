Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'home/index'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'comments/create'

  get 'comments/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'boards#index'
  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show'
  root 'home#index'
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: %i[create destroy]
  #resources :boards, only: [:index, :new, :create, :show, :edit, :update]

end

Rails.application.routes.draw do

  get 'mypage', to: 'users#me'
  post 'login' ,to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

# see http://guides.rubyonrails.org/routing.html
  # root "boards#index"
  root 'home#index'
  resources :boards
  resources :users, only: %i[new create]
  resources :comments, only: %i[create destroy]
end

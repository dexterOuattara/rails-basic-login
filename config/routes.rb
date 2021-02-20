Rails.application.routes.draw do
  resources :casestudies
  resources :categories
  resources :posts
  get 'pages/casestudies'

  get 'pages/interviewpreparation'

  root to: 'pages#home'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

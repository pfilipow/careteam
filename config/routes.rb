Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :blogs
  
  resources :articles do
    resources :comments, only: [:index, :create]
  end

  resources :comments, only: [:show]

  root "articles#index"
end

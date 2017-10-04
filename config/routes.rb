Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :blogs
  
  resources :articles do
    resources :comments, only: [:index, :create, :new]
  end

  resources :comments, only: [:edit, :show, :update, :destroy]

  root "articles#index"
end

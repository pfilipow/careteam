Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :blogs do
    resources :articles, only: [:index, :create, :new]
  end

  resources :articles, only: [:edit, :show, :update, :destroy] do
    resources :comments, only: [:index, :create, :new]
  end

  resources :comments, only: [:edit, :show, :update, :destroy]

end

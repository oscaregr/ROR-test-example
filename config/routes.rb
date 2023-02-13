Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  root 'users#index', via: [:get, :post]

  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :home, only: [:index]
end

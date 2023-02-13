Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :authentication do
    resources :users, only: [:new, :create], path: '/'
  end

  resources :home, only: [:index, :update, :destroy]
end

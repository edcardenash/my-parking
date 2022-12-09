Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :parkings do
    resources :reviews, only: [:new, :create]
  end
  resources :rentals
  resources :reviews
  resources :countries
  resources :cities
end

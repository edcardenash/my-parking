Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :parkings do
    resources :reviews, only: [:new, :create]
    resources :rentals, only: :create
    collection do
      get "my_parkings"
    end
  end
  resources :rentals, only: [:index, :destroy, :show]
  resources :reviews
  resources :countries
  resources :cities
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :parkings do
    resources :reviews, only: [:new, :create]
    resources :rentals, only: :create
  end
  resources :rentals, only: [:index, :destroy, :show]
  # delete "rentals/:id", to: "rentals#destroy", as: :rental_destroy
  resources :reviews
  resources :countries
  resources :cities
end

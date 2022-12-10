Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :parkings do
    resources :reviews, only: [:new, :create]
    resources :rentals, except: [:index, :new, :edit, :update, :destroy]
  end
  resources :rentals
  resources :reviews
  resources :countries
  resources :cities
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :parkings do
    resources :rentals, except: [:index, :new, :edit, :update, :destroy]
  end
  resources :rentals
  resources :reviews
  resources :countrys
  resources :citys
end

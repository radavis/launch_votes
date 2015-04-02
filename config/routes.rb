Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]
  resources :nominations, only: [:new, :create, :index]

  root to: "home#index"
end

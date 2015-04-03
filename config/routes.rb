Rails.application.routes.draw do
  devise_for :users
  resources :home, only: [:index]
  resources :nominations, only: [:new, :create, :index]

  resources :nominations, only: [] do
    resources :votes, only: [:create]
  end

  root to: "home#index"
end

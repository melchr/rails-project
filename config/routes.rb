Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:index, :show]
  resources :reviews do
    resources :comments
  end

  root to: "home#index"
  
end
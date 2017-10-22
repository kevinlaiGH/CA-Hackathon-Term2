Rails.application.routes.draw do
  devise_for :users

  resources :products do
    resources :reviews
  end

  resources :charges
  root to: "products#index"


end

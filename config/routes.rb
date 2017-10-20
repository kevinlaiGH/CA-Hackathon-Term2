Rails.application.routes.draw do
  devise_for :users

  
  resources :charges
  root to: "products#index"


end

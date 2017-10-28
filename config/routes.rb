Rails.application.routes.draw do
  devise_for :users

  resources :carts
  resources :products do
    resources :reviews
    # member do
    # get :add_to_cart
    # end
  end

  resources :cart_items, only: [:create, :destroy]
  

  # product POST   /products/:id/create(.:format)  cart_items#create

  resources :searches
  resources :charges
  root to: "products#index"


  # resources :carts, only: [:show]
  # post '/add_item' => 'carts#add_item'
  # post '/update_item' => 'carts#update_item'
  # delete '/delete_item' => 'carts#delete_item'


end

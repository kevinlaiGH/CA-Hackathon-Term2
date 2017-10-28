class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DeviseWhitelist
  # include CurrentUserConcern
  before_action :set_cart
  before_action :load_cart

    def load_cart
      @cart = Cart.find(session[:cart_id]) if session[:cart_id].present?
    end

    def set_cart
      if session[:cart_id].blank?
        cart = Cart.create(status:"pending")
        session[:cart_id] = cart.id
      else
        cart = Cart.find(session[:cart_id])
      end
    end


end

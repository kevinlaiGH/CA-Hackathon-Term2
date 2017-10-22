class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # include CurrentUserConcern

  before_action :load_cart

    def load_cart
      @cart = Cart.find(session[:cart_id]) if session[:cart_id].present?
    end

end

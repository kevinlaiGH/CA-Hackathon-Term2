class ChargesController < ApplicationController

  before_action :authenticate_user!

def show
end

def index

end

def new
end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end

require "stripe"
Stripe.api_key = "sk_test_IXsukWL0MPGwS0RYfG9ZDuMt"

  def new

  end

  def create
  #   # Amount in cents
  #   @amount = 500
  #
  #   customer = Stripe::Customer.create(
  #     :email => params[:stripeEmail],
  #     :source  => params[:stripeToken]
  #   )
  #
  #   charge = Stripe::Charge.create(
  #     :customer    => customer.id,
  #     :amount      => @amount,
  #     :description => 'Rails Stripe customer',
  #     :currency    => 'usd'
  #   )
  #
  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  end

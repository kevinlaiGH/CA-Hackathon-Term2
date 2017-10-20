class Transaction < ApplicationRecord
  belongs_to :user

  require "stripe"
Stripe.api_key = "pk_test_ZoHbNHzVLBRLpFGozCLhYUfN"

Stripe::Customer.create(
  :description => "Customer for emily.smith@example.com",
  :source => "tok_mastercard" # obtained with Stripe.js
)
end

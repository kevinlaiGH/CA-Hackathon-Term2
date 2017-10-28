class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1

end
